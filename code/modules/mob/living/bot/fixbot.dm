/mob/living/bot/fixbot
	name = "Fixbot"
	desc = "A little fixing robot. He looks somewhat underwhelmed."
	icon_state = "fixrobot2_final"
	req_one_access = list(access_robotics)
	botcard_access = list(access_robotics)

	//AI vars
	var/last_newpatient_speak = 0
	var/vocal = 1

	//Healing vars
	var/obj/item/weapon/welder_tank/tank = /obj/item/weapon/welder_tank //Can be set to draw from this for reagents.
	var/fuel_amount = 15 //How much reagent do we inject at a time?
	var/heal_threshold = 10 //Start healing when they have this much damage in a category

/mob/living/bot/fixbot/handleIdle()
	if(vocal && prob(1))
		var/message = pick("I don't think it's a good idea to drink from the fuel tank", "Just f-f-fix it", "Created from the depths of the hell-ghetto", "Satis-F-Fixtion!")
		say(message)

/mob/living/bot/fixbot/handleAdjacentTarget()
	UnarmedAttack(target)

/mob/living/bot/fixbot/lookForTargets()
	for(var/mob/living/L in view(7, src)) // Time to find a patient!
		if(confirmTarget(L))
			target = L
			if(last_newpatient_speak + 300 < world.time)
				var/message = pick("Hey, [L.name]! I need to f-fix you!", "Wait [L.name]! Just get into a comfortable position!", "[L.name],It will take a lot of fuel to f-f-fix you")
				say(message)
				custom_emote(1, "points at [L.name].")
				last_newpatient_speak = world.time
			break

/mob/living/bot/fixbot/UnarmedAttack(mob/living/L, proximity)
	if(!..())
		return

	if(!on)
		return

	if(!istype(L))
		return

	if(busy)
		return

	if(L.stat == DEAD)
		var/death_message = pick("I was one of those bots, who just wanted to fix...")
		say(death_message)
		target = null
		return

	var/t = confirmTarget(L)
	if(!t)
		var/message = pick("All patched up!", "More fuel - more living robots", "You're welcome!")
		say(message)
		target = null
		return

	icon_state = "medibots"
	visible_message("<span class='warning'>[src] is trying to repair [L]!</span>")
	busy = 1
	update_icons()
	if(do_mob(src, L, 5 SECONDS))
		if(!tank || !tank.reagents.has_reagent(/datum/reagent/fuel, 1))
			visible_message("<span class='notice'>[src] beeps red, indicating that it needs more fuel!</span>")
			busy = 0
			update_icons()
			return
		if(istype(t,/mob/living/bot))
			var/mob/living/bot/B = L
			if(!emagged)
				B.health = min(B.maxHealth,B.health+heal_threshold)
				visible_message("<span class='notice'>[src] repairs [L]!</span>")
			else
				B.health = max(5,B.health-3)
				visible_message("<span class='notice'>[src] damages [L]!</span>")
		else
			if(isrobot(L))
				var/mob/living/silicon/robot/R = L
				if(!emagged)
					R.health = min(R.maxHealth,R.health+heal_threshold)
					visible_message("<span class='warning'>[src] repairs [L]!</span>")
				else
					R.health = max(5,R.health-3)
					visible_message("<span class='notice'>[src] damages [L]!</span>")
			else
				var/obj/item/organ/external/O = t
				if(!emagged)
					O.heal_damage(rand(4,8),0,1,1)
					visible_message("<span class='warning'>[src] repairs [L]'s [O.name]!</span>")
				else
					O.take_external_damage(0, rand(4,8), 0)
					visible_message("<span class='notice'>[src] damages [L]'s [O.name]!</span>")
	playsound(loc, 'sound/items/Welder.ogg', 20, 1)
	tank.reagents.remove_reagent(/datum/reagent/fuel, 1)
	busy = 0
	update_icons()

/mob/living/bot/fixbot/update_icons()
	overlays.Cut()
	if(on)
		icon_state = "fixrobot2"
	else
		icon_state = "fixrobot2_final"

/mob/living/bot/fixbot/attackby(obj/item/O, mob/user)
	if(istype(O, /obj/item/weapon/welder_tank))
		if(locked)
			to_chat(user, "<span class='notice'>You cannot insert a fuel tank because the panel is locked.</span>")
			return
		if(!isnull(tank))
			to_chat(user, "<span class='notice'>There is already a fuel tank loaded.</span>")
			return

		user.drop_item()
		O.loc = src
		tank = O
		to_chat(user, "<span class='notice'>You insert [O].</span>")
		return
	else
		..()

/mob/living/bot/fixbot/GetInteractTitle()
	. = "<head><title>Fixbot v1.0 controls</title></head>"
	. += "<b>Automatic Robot Fixing Unit v1.0</b>"

/mob/living/bot/fixbot/GetInteractStatus()
	. = ..()
	. += "<br>Fuel: "
	if(tank)
		. += "<A href='?src=\ref[src];command=eject'>Loaded \[[tank.reagents.total_volume]/[tank.max_fuel]\]</a>"
	else
		. += "None loaded"

/mob/living/bot/fixbot/GetInteractPanel()
	. += "<br>The speaker switch is [vocal ? "on" : "off"]. <a href='?src=\ref[src];command=togglevoice'>Toggle</a>"

/mob/living/bot/fixbot/GetInteractMaintenance()
	. = "Repairing mode: "
	switch(emagged)
		if(0)
			. += "Repair"
		if(1)
			. += "ERROROROROROR-----"

/mob/living/bot/fixbot/ProcessCommand(mob/user, command, href_list)
	..()
	if(CanAccessPanel(user))
		switch(command)
			if("eject")
				if(tank)
					if(!locked)
						tank.dropInto(src.loc)
						tank = null
					else
						to_chat(user, "<span class='notice'>You cannot eject the fuel tank because the panel is locked.</span>")
			if("togglevoice")
				if(!locked || issilicon(user))
					vocal = !vocal

/mob/living/bot/fixbot/emag_act(remaining_uses, mob/user)
	. = ..()
	if(!emagged)
		if(user)
			to_chat(user, "<span class='warning'>You short out [src]'s repairing circuits.</span>")
			ignore_list |= user
		visible_message("<span class='warning'>[src] buzzes oddly!</span>")
		flick("medibot_spark", src)
		target = null
		busy = 0
		emagged = 1
		on = 1
		update_icons()
		. = 1

/mob/living/bot/fixbot/explode()
	on = 0
	visible_message("<span class='danger'>[src] blows apart!</span>")
	var/turf/Tsec = get_turf(src)

	new /obj/structure/reagent_dispensers/fueltank(Tsec)
	new /obj/item/device/robotanalyzer(Tsec)
	var/obj/item/weapon/weldingtool/WT = new /obj/item/weapon/weldingtool(Tsec)
	WT.tank = null
	new /obj/item/device/assembly/prox_sensor(Tsec)
	if (prob(50))
		if(prob(50))
			new /obj/item/robot_parts/l_arm(Tsec)
		else
			new /obj/item/robot_parts/r_arm(Tsec)
	if(tank)
		tank.loc = Tsec
		tank = null

	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	qdel(src)
	return

/mob/living/bot/fixbot/confirmTarget(mob/living/L)
	if(!..())
		return 0

	if(L.stat == DEAD) // He's dead, Jim
		return 0

	if(!tank)
		return 0

	if(istype(L,/mob/living/bot))
		var/mob/living/bot/B = L
		if(B.maxHealth-B.health>=heal_threshold)
			return B

	if(isrobot(L))
		var/mob/living/silicon/robot/R = L
		if(R.maxHealth-R.health>=heal_threshold)
			return R

	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		for(var/obj/item/organ/external/O in H.organs)
			if(!O)
				continue
			if(O.get_brute_damage() >= heal_threshold && O.get_brute_damage() <= ROBOLIMB_SELF_REPAIR_CAP && (istype(H.species,SPECIES_IPC) || BP_IS_ROBOTIC(O)))
				return O


/* Construction */

/obj/structure/reagent_dispensers/fueltank/attackby(obj/item/robot_parts/S, mob/user as mob)
	if ((!istype(S, /obj/item/robot_parts/l_arm)) && (!istype(S, /obj/item/robot_parts/r_arm)))
		..()
		return

	var/obj/item/weapon/fixbot_arm_assembly/A = new /obj/item/weapon/fixbot_arm_assembly

	qdel(S)
	user.put_in_hands(A)
	to_chat(user, "<span class='notice'>You add the robot arm to the fuel tank.</span>")
	user.drop_from_inventory(src)
	qdel(src)

/obj/item/weapon/fixbot_arm_assembly
	name = "fuel tank/robot arm assembly"
	desc = "A fuel tank with a robot arm permanently grafted to it."
	icon = 'icons/obj/aibots.dmi'
	icon_state = "fixrobot_arm"
	var/build_step = 0
	var/created_name = "Fixbot"
	var/obj/item/weapon/welder_tank/tank = null
	w_class = ITEM_SIZE_NORMAL

/obj/item/weapon/fixbot_arm_assembly/attackby(obj/item/weapon/W as obj, mob/user as mob)
	..()
	if(istype(W, /obj/item/weapon/pen))
		var/t = sanitizeSafe(input(user, "Enter new robot name", name, created_name), MAX_NAME_LEN)
		if(!t)
			return
		if(!in_range(src, usr) && loc != usr)
			return
		created_name = t
	else
		switch(build_step)
			if(0)
				if(istype(W, /obj/item/device/robotanalyzer))
					user.drop_item()
					qdel(W)
					build_step++
					to_chat(user, "<span class='notice'>You add the robot analyzer to [src].</span>")
					SetName("Fuel tank/robot arm/robot analyzer assembly")
					overlays += image('icons/obj/aibots.dmi', "fixrobot_a+lyx")
			if(1)
				if(isWelder(W))
					var/obj/item/weapon/weldingtool/WT = W
					if(WT.tank)
						tank = WT.tank
						WT.tank = null
					user.drop_item()
					qdel(W)
					build_step++
					to_chat(user, "<span class='notice'>You add the welding tool to [src].</span>")
					SetName("Fuel tank/robot arm/robot analyzer/welding tool assembly")
					overlays += image('icons/obj/aibots.dmi', "fixrobot_a+l+w")
			if(2)
				if(isprox(W))
					user.drop_item()
					qdel(W)
					to_chat(user, "<span class='notice'>You complete the Fixbot! Beep boop.</span>")
					var/turf/T = get_turf(src)
					var/mob/living/bot/fixbot/S = new /mob/living/bot/fixbot(T)
					S.SetName(created_name)
					S.on = 0
					S.tank = tank
					S.update_icons() // apply the skin
					user.drop_from_inventory(src)
					qdel(src)

/mob/living
	var/hiding

/mob/living/proc/hide()
	set name = "Hide"
	set desc = "Allows to hide beneath tables or certain items. Toggled on or off."
	set category = "Abilities"

	if(incapacitated())
		return

	if(world.time < last_special + 5 SECONDS)
		to_chat(src, SPAN_WARNING("You need to wait a bit!"))
		return
	last_special = world.time

	hiding = !hiding
	if(hiding)
		to_chat(src, "<span class='notice'>You are now hiding.</span>")
	else
		to_chat(src, "<span class='notice'>You have stopped hiding.</span>")
	reset_layer()

/mob/living/proc/breath_death()
	set name = "Breath Death"
	set desc = "Infect others with your very breath."
	set category = "Abilities"

	if (last_special > world.time)
		to_chat(src, "<span class='warning'>You aren't ready to do that! Wait [round(last_special - world.time) / 10] seconds.</span>")
		return

	if (incapacitated())
		to_chat(src, "<span class='warning'>You can't do that while you're incapacitated!</span>")
		return

	last_special = world.time + 60 SECONDS

	var/turf/T = get_turf(src)
	var/obj/effect/effect/water/chempuff/chem = new(T)
	chem.create_reagents(10)
	chem.reagents.add_reagent(/datum/reagent/toxin/zombie, 2)
	chem.set_up(get_step(T, dir), 2, 10)
	playsound(T, 'sound/hallucinations/wail.ogg', 20, 1)

/mob/living/proc/consume()
	set name = "Consume"
	set desc = "Regain life by consuming it from others."
	set category = "Abilities"

	if (last_special > world.time)
		to_chat(src, "<span class='warning'>You aren't ready to do that! Wait [round(last_special - world.time) / 10] seconds.</span>")
		return

	if (incapacitated())
		to_chat(src, "<span class='warning'>You can't do that while you're incapacitated!</span>")
		return

	var/mob/living/target
	for (var/mob/living/L in get_turf(src))
		if (L != src && (L.lying || L.stat == DEAD))
			target = L
			break
	if (!target)
		to_chat(src, "<span class='warning'>You aren't on top of a victim!</span>")
		return

	last_special = world.time + 5 SECONDS

	src.visible_message("<span class='danger'>\The [src] hunkers down over \the [target], tearing into their flesh.</span>")
	if(do_mob(src, target, 5 SECONDS))
		to_chat(target,"<span class='danger'>\The [src] scrapes your flesh from your bones!</span>")
		to_chat(src,"<span class='danger'>You feed hungrily off \the [target]'s flesh.</span>")
		target.adjustBruteLoss(25)
		if(target.getBruteLoss() < -target.maxHealth)
			target.gib()
		src.adjustBruteLoss(-25)

/mob/living/proc/morph()
	set name = "Morph"
	set desc = "Morph into an object near you."
	set category = "Abilities"

	if (last_special > world.time)
		to_chat(src, "<span class='warning'>You aren't ready to do that! Wait [round(last_special - world.time) / 10] seconds.</span>")
		return

	if (incapacitated())
		to_chat(src, "<span class='warning'>You can't do that while you're incapacitated!</span>")
		return

	last_special = world.time + 10 SECONDS

	var/list/choices = list()
	for(var/obj/item/I in view(1,src))
		choices += M

	var/obj/item/target = input(src, "To what do you want to morph?") as null|anything in choices

	if(!target)
		return

	if(istype(src,/mob/living/simple_animal/typhon/mimic))
		//add anim

	if(do_mob(src, target, 5 SECONDS))
		src.visible_message("<span class='notice'>[src] transforms into [target]!</span>")
		var/obj/item/I = new(target)
		I.loc = get_turf(src)
		I.mimic = src
		src.loc = I

/obj/attackby(obj/item/O, mob/living/user)
	if(mimic)
		mimic.loc = get_turf(src)

		mimic.visible_message("<span class='danger'>\The [src] has been attacked with \the [O] by [user]!</span>")
		var/damage = O.force
		if (O.damtype == PAIN)
			damage = 0
		if (O.damtype == STUN)
			damage = (O.force / 8)
		if(supernatural && istype(O,/obj/item/weapon/nullrod))
			damage *= 2
			purge = 3
		damage *= 1.5
		mimic.adjustBruteLoss(damage)

		mimic = null
		qdel(src)
		return
	return ..()
/mob/living/simple_animal/typhon
	name = "typhon"
	real_name = "typhon"
	desc = "???"

/mob/living/simple_animal/typhon/get_scooped(mob/living/carbon/grabber)
	return

/mob/living/simple_animal/typhon/mimic
	name = "typhon mimic"
	real_name = "typhon mimic"
	desc = "A small, quivering sluglike creature."
	speak_emote = list("chirrups")
	emote_hear = list("chirrups")
	response_help  = "pokes"
	response_disarm = "prods"
	response_harm   = "stomps on"
	icon_state = "brainslug"
	item_state = "voxslug" // For the lack of a better sprite...
	icon_living = "brainslug"
	icon_dead = "brainslug_dead"
	speed = 0.4
	a_intent = I_HURT
	stop_automated_movement = 1
	status_flags = CANPUSH
	attacktext = "nipped"
	friendly = "prods"
	wander = 0
	pass_flags = PASS_FLAG_TABLE
	universal_understand = 1
	holder_type = /obj/item/weapon/holder/borer
	mob_size = MOB_SMALL
	can_escape = 1

	var/mob/living/carbon/human/host        // Human host for the brain worm.
	var/truename                            // Name used for brainworm-speak.
	var/roundstart

/mob/living/simple_animal/typhon/mimic/roundstart
	roundstart = 1

/mob/living/simple_animal/typhon/mimic/Login()
	..()
	if(mind)
		GLOB.typhones.add_antagonist(mind)

/mob/living/simple_animal/typhon/mimic/New(atom/newloc, gen=1)
	..(newloc)

	//add_language("Cortical Link")
	//verbs += /mob/living/proc/ventcrawl
	//verbs += /mob/living/proc/hide

	generation = gen
	truename = "[borer_names[min(generation, borer_names.len)]] [random_id("typon mimic[generation]", 1000, 9999)]"
	if(!roundstart) request_player()

/mob/living/simple_animal/typhon/mimic/Stat()
	. = ..())
	if(evacuation_controller)
		var/eta_status = evacuation_controller.get_status_panel_eta()
		if(eta_status)
			stat(null, eta_status)

//Procs for grabbing players.
/mob/living/simple_animal/typhon/mimic/proc/request_player()
	var/datum/ghosttrap/G = get_ghost_trap("typhon mimic")
	G.request_player(src, "A typhon mimic needs a player.")
GLOBAL_DATUM_INIT(typhons, /datum/antagonist/xenos/typhon, new)

/datum/antagonist/xenos/typhon
	id = MODE_TYPHON
	role_text = "Typhon"
	role_text_plural = "Typhons"
	mob_path = /mob/living/simple_animal/typhon/mimic
	welcome_text = "" //needs message
	antag_indicator = "hudtyphon"
	antaghud_indicator = "hudtyphon"

	initial_spawn_req = 1
	initial_spawn_target = 1

	station_crew_involved = FALSE

/datum/antagonist/xenos/typhon/create_objectives(datum/mind/player)
	if(!..())
		return
	//player.objectives += new /datum/objective/borer_survive()
	//player.objectives += new /datum/objective/borer_reproduce()
	//player.objectives += new /datum/objective/escape()

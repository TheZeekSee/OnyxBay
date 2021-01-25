GLOBAL_DATUM_INIT(revs, /datum/antagonist/prisoner, new)

/datum/antagonist/revolutionary
	id = MODE_PRISONER
	role_text = "Prisoner"
	feedback_tag = "pris_objective"
	antag_indicator = "prisoner"
	welcome_text = "You were defeated by the government and sentenced to life in prison! It's time to return to a free life!"
	victory_text = "The law didn't keep track of particularly dangerous criminals, the prisoners got out!"
	loss_text = "The prisoners did not resist the law. The fate of the prisoners is unknown."
	victory_feedback_tag = "win -  prisoners escaped"
	loss_feedback_tag = "loss - prisoners killed"
	flags = ANTAG_SUSPICIOUS | ANTAG_VOTABLE
	antaghud_indicator = "hudrevolutionary"

	hard_cap = 2
	hard_cap_round = 3
	initial_spawn_req = 2
	initial_spawn_target = 3

	blacklisted_jobs = list(/datum/job/ai, /datum/job/cyborg, /datum/job/captain, /datum/job/officer, /datum/job/hos)
	restricted_jobs = list(/datum/job/prisoner)
	additional_restricted_jobs = list(/datum/job/officer, /datum/job/warden, /datum/job/detective)


/datum/antagonist/prisoner/create_global_objectives()

	if(!..())
		return

	var/datum/objective/survive/survive = new
	survive.owner = player
	player.objectives |= survive
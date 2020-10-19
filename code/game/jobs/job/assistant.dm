/datum/job/assistant
	title = "Assistant"
	department = "Civilian"
	department_flag = CIV

	total_positions = -1
	spawn_positions = -1
	supervisors = "absolutely everyone"
	selection_color = "#515151"
	economic_modifier = 1
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	alt_titles = list("Technical Assistant","Medical Intern","Research Assistant")
	outfit_type = /decl/hierarchy/outfit/job/assistant

/datum/job/assistant/get_access()
	if(config.assistant_maint)
		return list(access_maint_tunnels)
	else
		return list()

/datum/job/assistant/equip(mob/living/carbon/human/H, alt_title)
	. = ..()
	if(.)
		var/obj/item/weapon/card/id/id = H.GetIdCard()
		switch(alt_title)
			if("Technical Assistant")
				id.access += access_engine
			if("Medical Intern")
				id.access += access_medical
			if("Research Assistant")
				id.access += access_research

/datum/job/prisoner
	title = "Prisoner"
	department = "Civilian"
	department_flag = CIV

	total_positions = 2
	spawn_positions = 2
	supervisors = "absolutely everyone"
	selection_color = "#FF7F50"
	economic_modifier = 0
	access = list()
	minimal_access = list()
	outfit_type = /decl/hierarchy/outfit/job/prisoner
	latejoin_at_spawnpoints = 1

/datum/job/prisoner/get_access()
	return

/datum/job/prisoner/equip(mob/living/carbon/human/H)
	. = ..()
	if(.)
		var/obj/item/weapon/implant/tracking/L = new /obj/item/weapon/implant/tracking(H)
		L.imp_in = H
		L.implanted = 1
		var/obj/item/organ/external/affected = H.organs_by_name[BP_HEAD]
		affected.implants += L
		L.part = affected
		L.implanted(src)
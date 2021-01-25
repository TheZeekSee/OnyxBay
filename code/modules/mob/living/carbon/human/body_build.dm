var/global/datum/body_build/default_body_build = new


/datum/body_build
	var/name		= "Default"

	var/genders		= list(MALE, FEMALE, NEUTER, PLURAL)
	var/index		= ""
	var/roboindex   = ""										// for slim and slim_alt BBs prothesis
	var/misk_icon	= 'icons/mob/mob.dmi'
	var/uniform_icon= 'icons/inv_slots/uniforms/mob.dmi'
	var/suit_icon	= 'icons/inv_slots/suits/mob.dmi'
	var/gloves_icon	= 'icons/inv_slots/gloves/mob.dmi'
	var/glasses_icon= 'icons/inv_slots/glasses/mob.dmi'
	var/ears_icon	= 'icons/inv_slots/ears/mob.dmi'
	var/mask_icon	= 'icons/inv_slots/masks/mob.dmi'
	var/hat_icon	= 'icons/inv_slots/hats/mob.dmi'
	var/shoes_icon	= 'icons/inv_slots/shoes/mob.dmi'
	var/belt_icon	= 'icons/inv_slots/belts/mob.dmi'
	var/s_store_icon= 'icons/mob/onmob/belt_mirror.dmi'
	var/back_icon	= 'icons/inv_slots/back/mob.dmi'
	var/ties_icon	= 'icons/inv_slots/acessories/mob.dmi'
	var/hidden_icon = 'icons/inv_slots/hidden/mob.dmi'
	var/rig_back	= 'icons/inv_slots/rig/mob.dmi'
	var/id_icon		= 'icons/mob/onmob/id.dmi'
	var/blood_icon	= 'icons/mob/human_races/masks/blood_human.dmi'

	//var/r_hand		= 'icons/inv_slots/items/items_r_default.dmi'
	//var/l_hand		= 'icons/inv_slots/items/items_l_default.dmi'

	var/l_hand = 'icons/mob/onmob/items/lefthand.dmi'
	var/r_hand = 'icons/mob/onmob/items/righthand.dmi'

	//var/list/hand_groups = list()

/datum/body_build/New()
	// hand_groups["[SPRITE_UNIFORMS]_l"] = 'icons/inv_slots/uniforms/hand_l_default.dmi'
	// hand_groups["[SPRITE_UNIFORMS]_r"] = 'icons/inv_slots/uniforms/hand_r_default.dmi'
	// hand_groups["[SPRITE_SUITS]_r"]    = 'icons/inv_slots/suits/hand_r_default.dmi'
	// hand_groups["[SPRITE_SUITS]_l"]    = 'icons/inv_slots/suits/hand_l_default.dmi'
	// hand_groups["[SPRITE_BACKPACK]_l"] = 'icons/inv_slots/back/hand_l_default.dmi'
	// hand_groups["[SPRITE_BACKPACK]_r"] = 'icons/inv_slots/back/hand_r_default.dmi'
	// hand_groups["[SPRITE_GLOVES]_l"]   = 'icons/inv_slots/gloves/hand_l_default.dmi'
	// hand_groups["[SPRITE_GLOVES]_r"]   = 'icons/inv_slots/gloves/hand_r_default.dmi'
	// hand_groups["[SPRITE_MELEE]_l"]    = 'icons/inv_slots/items/melee_l_default.dmi'
	// hand_groups["[SPRITE_MELEE]_r"]    = 'icons/inv_slots/items/melee_r_default.dmi'
	// hand_groups["[SPRITE_STORAGE]_l"]  = 'icons/inv_slots/items/storage_l_default.dmi'
	// hand_groups["[SPRITE_STORAGE]_r"]  = 'icons/inv_slots/items/storage_r_default.dmi'
	// hand_groups["[SPRITE_GUNS]_l"]     = 'icons/inv_slots/items/guns_l_default.dmi'
	// hand_groups["[SPRITE_GUNS]_r"]     = 'icons/inv_slots/items/guns_r_default.dmi'

// /datum/body_build/proc/get_inhand_icon(var/group, var/hand)
// 	if(hand == LEFT)
// 		group += "_l"
// 	else
// 		group += "_r"
// 	if(group in hand_groups)
// 		return hand_groups[group]
// 	else
// 		return (hand == LEFT) ? l_hand : r_hand

/datum/body_build/proc/get_mob_icon(slot, icon_state)
	var/icon/I
	if(!slot in default_onmob_slots)
		world.log << "##ERROR. Wrong sprite group for mob icon \"[slot]\""
		return I // Nonexistent slot, just give 'em an empty icon
	for(var/datum/body_build/BB in list(src, default_body_build))
		switch(slot)
			if(slot_handcuffed_str || slot == slot_legcuffed_str)
				I = BB.misk_icon
			else
				I = BB.clothing_icons[slot]
		if(icon_state in GLOB.bb_clothing_icon_states[BB.type][slot])
			break
	return I

/datum/body_build/slim
	name                 = "Slim"

	index                = "_slim"
	roboindex            = "_slim"
	genders              = list(FEMALE)
	clothing_icons       = list(
		"slot_w_uniform" = 'icons/inv_slots/uniforms/mob_slim.dmi',
		"slot_suit"      = 'icons/inv_slots/suits/mob_slim.dmi',
		"slot_gloves"    = 'icons/inv_slots/gloves/mob_slim.dmi',
		"slot_glasses"   = 'icons/inv_slots/glasses/mob_slim.dmi',
		"slot_l_ear"     = 'icons/inv_slots/ears/mob_slim.dmi',
		"slot_r_ear"     = 'icons/inv_slots/ears/mob_r_slim.dmi',
		"slot_wear_mask" = 'icons/inv_slots/masks/mob_slim.dmi',
		"slot_head"      = 'icons/inv_slots/hats/mob.dmi',
		"slot_shoes"     = 'icons/inv_slots/shoes/mob_slim.dmi',
		"slot_belt"      = 'icons/inv_slots/belts/mob_slim.dmi',
		"slot_s_store"   = 'icons/inv_slots/belts/mirror/mob_slim.dmi',
		"slot_back"      = 'icons/inv_slots/back/mob_slim.dmi',
		"slot_tie"       = 'icons/inv_slots/acessories/mob_slim.dmi',
		"hidden"         = 'icons/inv_slots/hidden/mob_slim.dmi',
		"slot_wear_id"   = 'icons/mob/onmob/id.dmi',
		"slot_l_hand"    = 'icons/mob/onmob/items/lefthand_slim.dmi',
		"slot_r_hand"    = 'icons/mob/onmob/items/righthand_slim.dmi'
		)
	rig_back             = 'icons/inv_slots/rig/mob_slim.dmi'
	blood_icon           = 'icons/mob/human_races/masks/blood_human_slim.dmi'

/datum/body_build/slim/alt
	name                 = "Slim Alt"

	index                = "_slim_alt"
	genders              = list(FEMALE)
	clothing_icons       = list(
		"slot_w_uniform" = 'icons/inv_slots/uniforms/mob_slimalt.dmi',
		"slot_suit"      = 'icons/inv_slots/suits/mob_slimalt.dmi',
		"slot_gloves"    = 'icons/inv_slots/gloves/mob_slim.dmi',
		"slot_glasses"   = 'icons/inv_slots/glasses/mob_slim.dmi',
		"slot_l_ear"     = 'icons/inv_slots/ears/mob_slim.dmi',
		"slot_r_ear"     = 'icons/inv_slots/ears/mob_r_slim.dmi',
		"slot_wear_mask" = 'icons/inv_slots/masks/mob_slim.dmi',
		"slot_head"      = 'icons/inv_slots/hats/mob.dmi',
		"slot_shoes"     = 'icons/inv_slots/shoes/mob_slimalt.dmi',
		"slot_belt"      = 'icons/inv_slots/belts/mob_slim.dmi',
		"slot_s_store"   = 'icons/inv_slots/belts/mirror/mob_slim.dmi',
		"slot_back"      = 'icons/inv_slots/back/mob_slim.dmi',
		"slot_tie"       = 'icons/inv_slots/acessories/mob_slim.dmi',
		"hidden"         = 'icons/inv_slots/hidden/mob_slimalt.dmi',
		"slot_wear_id"   = 'icons/mob/onmob/id.dmi',
		"slot_l_hand"    = 'icons/mob/onmob/items/lefthand_slim.dmi',
		"slot_r_hand"    = 'icons/mob/onmob/items/righthand_slim.dmi'
		)
	blood_icon           = 'icons/mob/human_races/masks/blood_human_slim_alt.dmi'

/datum/body_build/slim/male
	name                 = "Slim"

	index                = "_slim"
	roboindex            = "_slim"
	genders              = list(MALE)
	clothing_icons       = list(
		"slot_w_uniform" = 'icons/inv_slots/uniforms/mob_slim_m.dmi',
		"slot_suit"      = 'icons/inv_slots/suits/mob_slim_m.dmi',
		"slot_gloves"    = 'icons/inv_slots/gloves/mob_slim.dmi',
		"slot_glasses"   = 'icons/inv_slots/glasses/mob_slim.dmi',
		"slot_l_ear"     = 'icons/inv_slots/ears/mob_slim.dmi',
		"slot_r_ear"     = 'icons/inv_slots/ears/mob_r_slim.dmi',
		"slot_wear_mask" = 'icons/inv_slots/masks/mob_slim.dmi',
		"slot_head"      = 'icons/inv_slots/hats/mob.dmi',
		"slot_shoes"     = 'icons/inv_slots/shoes/mob_slim.dmi',
		"slot_belt"      = 'icons/inv_slots/belts/mob_slim.dmi',
		"slot_s_store"   = 'icons/inv_slots/belts/mirror/mob_slim.dmi',
		"slot_back"      = 'icons/inv_slots/back/mob_slim_m.dmi',
		"slot_tie"       = 'icons/inv_slots/acessories/mob_slim_m.dmi',
		"hidden"         = 'icons/inv_slots/hidden/mob_slim_m.dmi',
		"slot_wear_id"   = 'icons/mob/onmob/id.dmi',
		"slot_l_hand"    = 'icons/mob/onmob/items/lefthand_slim.dmi',
		"slot_r_hand"    = 'icons/mob/onmob/items/righthand_slim.dmi'
		)
	blood_icon           = 'icons/mob/human_races/masks/blood_human_m_slim.dmi'

/datum/body_build/slim/alt/tajaran //*sigh. I regret of doing this.
	name                 = "Slim Tajaran"

	clothing_icons       = list(
		"slot_w_uniform" = 'icons/inv_slots/uniforms/mob_slimalt.dmi',
		"slot_suit"      = 'icons/inv_slots/suits/mob_tajaran.dmi',
		"slot_gloves"    = 'icons/inv_slots/gloves/mob_slim.dmi',
		"slot_glasses"   = 'icons/inv_slots/glasses/mob_slim.dmi',
		"slot_l_ear"     = 'icons/inv_slots/ears/mob_slim.dmi',
		"slot_r_ear"     = 'icons/inv_slots/ears/mob_r_slim.dmi',
		"slot_wear_mask" = 'icons/inv_slots/masks/mob_tajaran.dmi',
		"slot_head"      = 'icons/inv_slots/hats/mob_tajaran.dmi',
		"slot_shoes"     = 'icons/inv_slots/shoes/mob_slim.dmi',
		"slot_belt"      = 'icons/inv_slots/belts/mob_slim.dmi',
		"slot_s_store"   = 'icons/inv_slots/belts/mirror/mob_slim.dmi',
		"slot_back"      = 'icons/inv_slots/back/mob_slim.dmi',
		"slot_tie"       = 'icons/inv_slots/acessories/mob_slim.dmi',
		"hidden"         = 'icons/inv_slots/hidden/mob_slimalt.dmi',
		"slot_wear_id"   = 'icons/mob/onmob/id.dmi',
		"slot_l_hand"    = 'icons/mob/onmob/items/lefthand_slim.dmi',
		"slot_r_hand"    = 'icons/mob/onmob/items/righthand_slim.dmi'
		)

	rig_back             = 'icons/inv_slots/rig/mob_slim.dmi'
	blood_icon           = 'icons/mob/human_races/masks/blood_human_slim.dmi'

/datum/body_build/tajaran
	name                 = "Tajaran"

	clothing_icons       = list(
		"slot_w_uniform" = 'icons/inv_slots/uniforms/mob.dmi',
		"slot_suit"      = 'icons/inv_slots/suits/mob_tajaran.dmi',
		"slot_gloves"    = 'icons/inv_slots/gloves/mob_tajaran.dmi',
		"slot_glasses"   = 'icons/inv_slots/glasses/mob.dmi',
		"slot_l_ear"     = 'icons/inv_slots/ears/mob.dmi',
		"slot_r_ear"     = 'icons/inv_slots/ears/mob_r.dmi',
		"slot_wear_mask" = 'icons/inv_slots/masks/mob_tajaran.dmi',
		"slot_head"      = 'icons/inv_slots/hats/mob_tajaran.dmi',
		"slot_shoes"     = 'icons/inv_slots/shoes/mob_tajaran.dmi',
		"slot_belt"      = 'icons/inv_slots/belts/mob.dmi',
		"slot_s_store"   = 'icons/inv_slots/belts/mirror/mob.dmi',
		"slot_back"      = 'icons/inv_slots/back/mob.dmi',
		"slot_tie"       = 'icons/inv_slots/acessories/mob.dmi',
		"hidden"         = 'icons/inv_slots/hidden/mob_tajaran.dmi',
		"slot_wear_id"   = 'icons/mob/onmob/id.dmi',
		"slot_l_hand"    = 'icons/mob/onmob/items/lefthand.dmi',
		"slot_r_hand"    = 'icons/mob/onmob/items/righthand.dmi'
		)

/datum/body_build/unathi
	name                 = SPECIES_UNATHI

	clothing_icons       = list(
		"slot_w_uniform" = 'icons/inv_slots/uniforms/mob.dmi',
		"slot_suit"      = 'icons/inv_slots/suits/mob_unathi.dmi',
		"slot_gloves"    = 'icons/inv_slots/gloves/mob.dmi',
		"slot_glasses"   = 'icons/inv_slots/glasses/mob.dmi',,
		"slot_l_ear"     = 'icons/inv_slots/ears/mob.dmi',
		"slot_r_ear"     = 'icons/inv_slots/ears/mob_r.dmi',
		"slot_wear_mask" = 'icons/inv_slots/masks/mob_unathi.dmi',
		"slot_head"      = 'icons/inv_slots/hats/mob_unathi.dmi',
		"slot_shoes"     = 'icons/inv_slots/shoes/mob.dmi',
		"slot_belt"      = 'icons/inv_slots/belts/mob.dmi',
		"slot_s_store"   = 'icons/inv_slots/belts/mirror/mob.dmi',
		"slot_back"      = 'icons/inv_slots/back/mob.dmi',
		"slot_tie"       = 'icons/inv_slots/acessories/mob.dmi',
		"hidden"         = 'icons/inv_slots/hidden/mob_unathi.dmi',
		"slot_wear_id"   = 'icons/mob/onmob/id.dmi',
		"slot_l_hand"    = 'icons/mob/onmob/items/lefthand.dmi',
		"slot_r_hand"    = 'icons/mob/onmob/items/righthand.dmi'
		)

/datum/body_build/vox
	name                 = "Vox"

	clothing_icons       = list(
		"slot_w_uniform" = 'icons/inv_slots/uniforms/mob_vox.dmi',
		"slot_suit"      = 'icons/inv_slots/suits/mob_vox.dmi',
		"slot_gloves"    = 'icons/inv_slots/gloves/mob_vox.dmi',
		"slot_glasses"   = 'icons/inv_slots/glasses/mob_vox.dmi',,
		"slot_l_ear"     = 'icons/inv_slots/ears/mob.dmi',
		"slot_r_ear"     = 'icons/inv_slots/ears/mob_r.dmi',
		"slot_wear_mask" = 'icons/inv_slots/masks/mob_vox.dmi',
		"slot_head"      = 'icons/inv_slots/hats/mob_vox.dmi',
		"slot_shoes"     = 'icons/inv_slots/shoes/mob_vox.dmi',
		"slot_belt"      = 'icons/inv_slots/belts/mob.dmi',
		"slot_s_store"   = 'icons/inv_slots/belts/mirror/mob.dmi',
		"slot_back"      = 'icons/inv_slots/back/mob.dmi',
		"slot_tie"       = 'icons/inv_slots/acessories/mob_vox.dmi',
		"hidden"         = 'icons/inv_slots/hidden/mob.dmi',
		"slot_wear_id"   = 'icons/mob/onmob/id.dmi',
		"slot_l_hand"    = 'icons/mob/onmob/items/lefthand.dmi',
		"slot_r_hand"    = 'icons/mob/onmob/items/righthand.dmi'
		)

/datum/body_build/monkey
	name                 = "Monkey"

	clothing_icons       = list(
		"slot_w_uniform" = 'icons/mob/species/monkey/uniform.dmi',
		"slot_suit"      = 'icons/inv_slots/suits/mob.dmi',
		"slot_gloves"    = 'icons/inv_slots/gloves/mob.dmi',
		"slot_glasses"   = 'icons/inv_slots/glasses/mob.dmi',,
		"slot_l_ear"     = 'icons/inv_slots/ears/mob.dmi',
		"slot_r_ear"     = 'icons/inv_slots/ears/mob_r.dmi',
		"slot_wear_mask" = 'icons/inv_slots/masks/mob.dmi',
		"slot_head"      = 'icons/inv_slots/hats/mob.dmi',
		"slot_shoes"     = 'icons/inv_slots/shoes/mob.dmi',
		"slot_belt"      = 'icons/inv_slots/belts/mob.dmi',
		"slot_s_store"   = 'icons/inv_slots/belts/mirror/mob.dmi',
		"slot_back"      = 'icons/inv_slots/back/mob.dmi',
		"slot_tie"       = 'icons/mob/species/monkey/ties.dmi',
		"hidden"         = 'icons/inv_slots/hidden/mob.dmi',
		"slot_wear_id"   = 'icons/mob/onmob/id.dmi',
		"slot_l_hand"    = 'icons/mob/onmob/items/lefthand.dmi',
		"slot_r_hand"    = 'icons/mob/onmob/items/righthand.dmi'
		)
	blood_icon           = 'icons/mob/human_races/masks/blood_monkey.dmi'

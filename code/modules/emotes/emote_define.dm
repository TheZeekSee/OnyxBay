// Note about emote messages:
// - USER / TARGET will be replaced with the relevant name, in bold.
// - USER_THEM / TARGET_THEM / USER_THEIR / TARGET_THEIR will be replaced with a
//   gender-appropriate version of the same.
// - Impaired messages do not do any substitutions.

/decl/emote

	var/key                            // Command to use emote ie. '*[key]'
	var/emote_message_1p               // First person message ('You do a flip!')
	var/emote_message_3p               // Third person message ('Urist McShitter does a flip!')
	var/emote_message_impaired         // Deaf/blind message ('You hear someone flipping out.', 'You see someone opening and closing their mouth')

	var/emote_message_1p_target        // 'You do a flip at Urist McTarget!'
	var/emote_message_3p_target        // 'Urist McShitter does a flip at Urist McTarget!'

	var/message_type = VISIBLE_MESSAGE // Audible/visual flag
	var/targetted_emote                // Whether or not this emote needs a target.
	var/check_restraints               // Can this emote be used while restrained?
	var/conscious = 1				   // Do we need to be awake to emote this?
	var/emote_sound
	var/sounded_species = list()

/decl/emote/proc/get_emote_message_1p(atom/user, atom/target, extra_params)
	if(target)
		return emote_message_1p_target
	return emote_message_1p

/decl/emote/proc/get_emote_message_3p(atom/user, atom/target, extra_params)
	if(target)
		return emote_message_3p_target
	return emote_message_3p

/*
/decl/emote/proc/play_emote_sound(mob/user, key, datum/gender/user_gender)


	switch (key)
		if ("cough")
			playsound(user, "[gender_prefix]_cough", rand(25, 40), FALSE)
		if ("scream")
			playsound(user, "[gender_prefix]_pain", rand(25, 40), FALSE)
		if ("gasp","choke")
			playsound(user, "[gender_prefix]_breath", rand(25, 40), FALSE)
*/

/decl/emote/proc/do_emote(atom/user, extra_params)

	if(ismob(user) && check_restraints)
		var/mob/M = user
		if(M.restrained())
			to_chat(user, "<span class='warning'>You are restrained and cannot do that.</span>")
			return

	var/atom/target
	if(can_target() && extra_params)
		extra_params = lowertext(extra_params)
		for(var/atom/thing in view(user))
			if(extra_params == lowertext(thing.name))
				target = thing
				break

	var/datum/gender/user_gender = gender_datums[user.get_visible_gender()]
	var/datum/gender/target_gender
	if(target)
		target_gender = gender_datums[target.get_visible_gender()]

	var/use_3p
	var/use_1p
	if(emote_message_1p)
		if(target && emote_message_1p_target)
			use_1p = get_emote_message_1p(user, target, extra_params)
			use_1p = replacetext(use_1p, "TARGET_THEM", target_gender.him)
			use_1p = replacetext(use_1p, "TARGET_THEIR", target_gender.his)
			use_1p = replacetext(use_1p, "TARGET", "<b>\the [target]</b>")
		else
			use_1p = get_emote_message_1p(user, null, extra_params)
		use_1p = capitalize(use_1p)

	if(emote_message_3p)
		if(target && emote_message_3p_target)
			use_3p = get_emote_message_3p(user, target, extra_params)
			use_3p = replacetext(use_3p, "TARGET_THEM", target_gender.him)
			use_3p = replacetext(use_3p, "TARGET_THEIR", target_gender.his)
			use_3p = replacetext(use_3p, "TARGET", "<b>\the [target]</b>")
		else
			use_3p = get_emote_message_3p(user, null, extra_params)
		use_3p = replacetext(use_3p, "USER_THEM", user_gender.him)
		use_3p = replacetext(use_3p, "USER_THEIR", user_gender.his)
		use_3p = replacetext(use_3p, "USER", "<b>\the [user]</b>")
		use_3p = capitalize(use_3p)

	if(message_type == AUDIBLE_MESSAGE)
		//play_emote_sound(user, key, user_gender)

		user.audible_message(message = use_3p, self_message = use_1p, deaf_message = emote_message_impaired, checkghosts = /datum/client_preference/ghost_sight)
	else
		user.visible_message(message = use_3p, self_message = use_1p, blind_message = emote_message_impaired, checkghosts = /datum/client_preference/ghost_sight)

	do_extra(user, target)
	if(emote_sound) do_sound(user, key, user_gender)

/decl/emote/proc/do_extra(atom/user, atom/target)
	return

/decl/emote/proc/check_user(atom/user)
	return TRUE

/decl/emote/proc/can_target()
	return (emote_message_1p_target || emote_message_3p_target)

/decl/emote/dd_SortValue()
	return key

/decl/emote/proc/do_sound(mob/user, key, datum/gender/user_gender)
	var/mob/living/carbon/human/H = user

	if (world.time > user.lastemote + 5 SECONDS)
		user.lastemote = world.time
	else
		return

	if(H.stat) return // No dead or unconcious people screaming pls.
	if(istype(H))
		if(sounded_species)
			if(H.species.name in sounded_species)
				if(islist(emote_sound))
					if(H.species.name == SPECIES_SKRELL)
						if(H.h_style == "Skrell Male Tentacles")
							return playsound(user.loc, pick(emote_sound[MALE]), 50, 0)
						else
							return playsound(user.loc, pick(emote_sound[FEMALE]), 50, 0)
					if(emote_sound[H.gender])
						return playsound(user.loc, pick(emote_sound[H.gender]), 50, 0)
				else
					return playsound(user.loc, emote_sound, 50, 0)
			return
		if(islist(emote_sound))
			return playsound(user.loc, pick(emote_sound), 50, 0)
		else
			return playsound(user.loc, emote_sound, 50, 0)
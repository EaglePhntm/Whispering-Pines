/datum/sex_action/blowjob
	name = "Suck them off"
	check_same_tile = FALSE
	check_incapacitated = FALSE
	gags_user = TRUE

/datum/sex_action/blowjob/shows_on_menu(mob/living/user, mob/living/target)
	if(!target.erpable && issimple(target))
		return FALSE

	if(user == target)
		return FALSE
	if(!target.getorganslot(ORGAN_SLOT_PENIS))
		if(issimple(target) && target.gender == MALE && target.sexcon)
		else
			return FALSE
	return TRUE

/datum/sex_action/blowjob/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(ishuman(target))
		var/mob/living/carbon/human/targethuman = target
		if(targethuman.wear_pants)
			var/obj/item/clothing/pants/pantsies = targethuman.wear_pants
			if(pantsies.flags_inv & HIDECROTCH)
				if(!pantsies.genital_access)
					return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_MOUTH))
		return FALSE
	if(!target.getorganslot(ORGAN_SLOT_PENIS))
		if(issimple(target) && target.gender == MALE && target.sexcon)
		else
			return FALSE
	return TRUE

/datum/sex_action/blowjob/on_start(mob/living/user, mob/living/target)
	..()
	if(HAS_TRAIT(user, TRAIT_TINY) && !(HAS_TRAIT(target, TRAIT_TINY)))
		user.visible_message(span_warning("[user] starts licking [target]'s cock..."))	//Changed to licking due to fairy size
	else
		user.visible_message(span_warning("[user] starts sucking [target]'s cock..."))

/datum/sex_action/blowjob/on_perform(mob/living/user, mob/living/target)
	if(user.sexcon.do_message_signature("[type]"))
		if(HAS_TRAIT(user, TRAIT_TINY) && !(HAS_TRAIT(target, TRAIT_TINY)))
			user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] licks [target]'s cock..."))
		else
			user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] sucks [target]'s cock..."))
	user.make_sucking_noise()
	do_thrust_animate(user, target)

	user.sexcon.perform_sex_action(target, 2, 0, TRUE)
	if(!target.sexcon.considered_limp())
		user.sexcon.perform_deepthroat_oxyloss(user, 1.3)
	if(target.sexcon.check_active_ejaculation())
		if(HAS_TRAIT(user, TRAIT_TINY) && !(HAS_TRAIT(target, TRAIT_TINY)))
			target.visible_message(span_lovebold("[target] cums onto [user]'s hair and face!"))
			target.sexcon.cum_onto()
		else
			target.visible_message(span_lovebold("[target] cums into [user]'s mouth!"))
			target.sexcon.cum_into(oral = TRUE)

/datum/sex_action/blowjob/on_finish(mob/living/user, mob/living/target)
	..()
	if(HAS_TRAIT(user, TRAIT_TINY) && !(HAS_TRAIT(target, TRAIT_TINY)))
		user.visible_message(span_warning("[user] stops licking [target]'s cock ..."))
	else
		user.visible_message(span_warning("[user] stops sucking [target]'s cock ..."))

/datum/sex_action/blowjob/is_finished(mob/living/user, mob/living/target)
	if(target.sexcon.finished_check())
		return TRUE
	return FALSE

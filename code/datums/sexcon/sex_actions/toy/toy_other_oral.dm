/datum/sex_action/toy_other_oral
	name = "Use toy on their mouth"

/datum/sex_action/toy_other_oral/shows_on_menu(mob/living/user, mob/living/target)
	if(!target.erpable && issimple(target))
		return FALSE

	if(user == target)
		return FALSE
	if(!get_dildo_in_either_hand(user))
		return FALSE
	if(HAS_TRAIT(target, TRAIT_TINY) && !(HAS_TRAIT(user, TRAIT_TINY))) //Non-fairy users cannot shrink item down to fit properly
		return FALSE
	return TRUE

/datum/sex_action/toy_other_oral/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(!get_location_accessible(target, BODY_ZONE_PRECISE_MOUTH))
		return FALSE
	if(!get_dildo_in_either_hand(user))
		return FALSE
	return TRUE

/datum/sex_action/toy_other_oral/on_start(mob/living/user, mob/living/target)
	var/obj/item/dildo = get_dildo_in_either_hand(user)
	if(check_dildo_silver(user))
		var/mob/living/carbon/human/H = target
		var/datum/antagonist/vampire/lord/V_lord = H.mind.has_antag_datum(/datum/antagonist/vampire/lord)
		var/datum/antagonist/werewolf/W = H.mind.has_antag_datum(/datum/antagonist/werewolf/)
		if(ishuman(target))
			if(H.mind.has_antag_datum(/datum/antagonist/vampire))
				to_chat(H, span_userdanger("This will HURT."))
			if(V_lord)
				if(!V_lord.ascended)
					to_chat(H, span_userdanger("This will sting a little."))
			if(W && W.transformed == TRUE)
				to_chat(H, span_userdanger("This will HURT."))
	user.visible_message(span_warning("[user] forces [target]'s to gobble on \the [dildo]..."))

/datum/sex_action/toy_other_oral/on_perform(mob/living/user, mob/living/target)
	var/obj/item/dildo = get_dildo_in_either_hand(user)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] forces [target] to suck on \the [dildo]..."))
	if(check_dildo_silver(user))
		other_dildoburn(user, target)
	target.make_sucking_noise()

/datum/sex_action/toy_other_oral/on_finish(mob/living/user, mob/living/target)
	var/obj/item/dildo = get_dildo_in_either_hand(user)
	user.visible_message(span_warning("[user] pulls \the [dildo] from [target]'s mouth."))

/datum/sex_action/toy_other_oral/is_finished(mob/living/user, mob/living/target)
	if(target.sexcon.finished_check())
		return TRUE
	return FALSE

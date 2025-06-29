/datum/sex_action/rub_body
	name = "Rub their body"
	check_same_tile = FALSE

/datum/sex_action/rub_body/shows_on_menu(mob/living/user, mob/living/target)
	if(!target.erpable && issimple(target))
		return FALSE

	if(user == target)
		return FALSE
	return TRUE

/datum/sex_action/rub_body/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(ishuman(target))
		var/mob/living/carbon/human/targethuman = target
		if(targethuman.wear_shirt)
			var/obj/item/clothing/shirt/shirtsies = targethuman.wear_shirt
			if(shirtsies.flags_inv & HIDEBOOB)
				if(shirtsies.genital_access == FALSE)
					return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_MOUTH))
		return FALSE
	return TRUE

/datum/sex_action/rub_body/on_start(mob/living/user, mob/living/target)
	..()
	user.visible_message(span_warning("[user] places their hands onto [target]..."))

/datum/sex_action/rub_body/on_perform(mob/living/user, mob/living/target)
	if(user.sexcon.do_message_signature("[type]"))
		user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] rubs [target]'s body..."))
	user.make_sucking_noise()

	user.sexcon.perform_sex_action(target, 0.5, 0, TRUE)
	target.sexcon.handle_passive_ejaculation()

/datum/sex_action/rub_body/on_finish(mob/living/user, mob/living/target)
	..()
	user.visible_message(span_warning("[user] stops rubbing [target]'s body ..."))

/datum/sex_action/rub_body/is_finished(mob/living/user, mob/living/target)
	if(target.sexcon.finished_check())
		return TRUE
	return FALSE

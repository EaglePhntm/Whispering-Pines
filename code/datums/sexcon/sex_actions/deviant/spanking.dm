/datum/sex_action/spanking
	name = "Spank them"
	check_same_tile = FALSE
	continous = TRUE
	stamina_cost = 0
	do_time = 1 SECONDS
	var/last_pain_sound = 0
	var/pain_sound_cooldown = 3 SECONDS

/datum/sex_action/spanking/shows_on_menu(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	return TRUE

/datum/sex_action/spanking/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	return TRUE

/datum/sex_action/spanking/on_start(mob/living/user, mob/living/target)
	..()
	user.visible_message(span_warning("[user] starts spanking [target]..."))

/datum/sex_action/spanking/on_perform(mob/living/user, mob/living/target)
	. = ..()
	playsound(target, 'sound/foley/slap.ogg', 50, TRUE, -1)

	// Flash screen red based on force level
	switch(user.sexcon.force)
		if(SEX_FORCE_LOW)
			target.flash_fullscreen("redflash1")
		if(SEX_FORCE_MID)
			target.flash_fullscreen("redflash2")
		if(SEX_FORCE_HIGH)
			target.flash_fullscreen("redflash3")
		if(SEX_FORCE_EXTREME)
			target.flash_fullscreen("redflash3")

	addtimer(CALLBACK(target, TYPE_PROC_REF(/mob, clear_fullscreen), "redflash"), 0.5 SECONDS)

	// Occasional pain sounds with proper emotes
	if(world.time > last_pain_sound + pain_sound_cooldown && prob(25))
		if(prob(50))
			target.emote("whimpers", intentional = FALSE)
		else
			target.emote("groans", intentional = FALSE)
		last_pain_sound = world.time

	var/force_text = user.sexcon.get_generic_force_adjective()
	user.visible_message(user.sexcon.spanify_force("[user] [force_text] spanks [target]!"))

	// Pain messages
	to_chat(target, span_warning("It stings!"))
	to_chat(target, span_danger("It hurts!"))

/datum/sex_action/spanking/on_finish(mob/living/user, mob/living/target)
	..()
	user.visible_message(span_warning("[user] stops spanking [target]..."))

/mob/dead/observer/verb/ghost_upward()
	set name = "Ghost Up"
	set category = "Spirit"

	if(!isobserver(usr))
		return

	ghost_up()

/mob/dead/observer/verb/ghost_downward()
	set name = "Ghost Down"
	set category = "Spirit"

	if(!isobserver(usr))
		return

	ghost_down()

/client/proc/descend()
	set name = "Journey to the Underworld"
	set category = "Spirit"

	switch(alert("Try to possess your next body?",,"Yes","No", "To Final Death"))
		if("No")
			to_chat(usr, span_warning("You have second thoughts."))
		if("To Final Death")
			if(isroguespirit(mob)) //HONEYPOT CODE, REMOVE LATER
				message_admins("[key] IS TRYING TO CRASH THE SERVER BY SPAWNING SPIRITS AS A SPIRIT!")
				return
			if((mob.has_flaw(/datum/charflaw/hunted) || HAS_TRAIT(mob, TRAIT_ZIZOID_HUNTED)) && !MOBTIMER_FINISHED(mob, MT_LASTDIED, 60 SECONDS))
				to_chat(mob, span_warning("Graggar's influence is currently preventing me from fleeing to the Underworld!"))
				return
			var/datum/mind/mind = mob.mind
			// Check if the player's job is hiv+
			var/datum/job/target_job = mind?.assigned_role
			if(target_job)
				if(target_job.job_reopens_slots_on_death)
					target_job.adjust_current_positions(-1)
				if(target_job.same_job_respawn_delay)
					// Store the current time for the player
					GLOB.job_respawn_delays[src.ckey] = world.time + target_job.same_job_respawn_delay
			if(ishuman(mind?.current))
				var/mob/living/carbon/human/D = mind?.current
				if(D && D.buried && D.funeral)
					mob.returntolobby()
					return
			if(!length(GLOB.underworldspiritspawns)) //That cant be good.
				to_chat(usr, span_danger("You are dead. Blood is fuel. Hell is somehow full. Alert an admin, as something is very wrong!"))
				return
			var/turf/spawn_loc = pick(GLOB.underworldspiritspawns)
			var/mob/living/carbon/spirit/O = new /mob/living/carbon/spirit(spawn_loc)
			O.livingname = mob.real_name
			O.ckey = ckey
			ADD_TRAIT(O, TRAIT_PACIFISM, TRAIT_GENERIC)
			O.set_patron(prefs.selected_patron)
			SSdeath_arena.add_fighter(O, mind?.last_death)

			if(HAS_TRAIT(mind?.current, TRAIT_BURIED_COIN_GIVEN))
				O.paid = TRUE
				to_chat(O, span_biginfo("Necra has guaranteed your passage to the next life. Your toll has been already paid."))

			var/area/rogue/underworld/underworld = get_area(spawn_loc)
			underworld.Entered(O, null)
			verbs -= /client/proc/descend
		if("Yes")
			if(mob.mind.has_antag_datum())
				to_chat(mob, span_warning("I am not able to reclone!"))
				return
			if(isroguespirit(mob)) //HONEYPOT CODE, REMOVE LATER
				message_admins("[key] IS TRYING TO CRASH THE SERVER BY SPAWNING BODIES WHILE A SPIRIT!")
				return
			if((mob.has_flaw(/datum/charflaw/hunted) || HAS_TRAIT(mob, TRAIT_ZIZOID_HUNTED)) && !MOBTIMER_FINISHED(mob, MT_LASTDIED, 60 SECONDS))
				to_chat(mob, span_warning("Graggar's influence is currently preventing me from fleeing to a new body or to the underworld!"))
				return
			var/obj/machinery/fake_powered/cloning_pod/spawn_loc = pick(GLOB.cloning_bays)
			if(!length(GLOB.cloning_bays)) //That cant be good.
				to_chat(usr, span_danger("There is no cloning bays, notify an admin."))
				return
			var/mob/living/carbon/human/O = new /mob/living/carbon/human(spawn_loc.loc)
			if(GLOB.global_biomass_storage < 1)
				spawn_loc.send_manual_alert()
				to_chat(usr, span_danger("The cloning bay network does not store enough biomass to make a new body. [GLOB.global_biomass_storage]/1. Machine alert sent."))
				return
			if(mob in SStreasury.bank_accounts)
				var/amt = SStreasury.bank_accounts[mob]
				if(amt < 0)
					spawn_loc.say("Warning; PATIENT HAS NO FUNDS, 250c DEBT MUST BE ISSUED.", language = /datum/language/ancient_english)
				else if(amt < 250)
					SStreasury.give_money_treasury(amt, "Partial recloning debt of [O.real_name].")
					spawn_loc.say("Warning; PATIENT HAS INSUFFICENT FUNDS AND STILL HAS [250-amt] IN DEBT.", language = /datum/language/ancient_english)
					amt = 0
					amt = SStreasury.bank_accounts[mob]
					record_featured_stat(FEATURED_STATS_TAX_PAYERS, mob, amt)
					GLOB.vanderlin_round_stats[STATS_TAXES_COLLECTED] += amt
				if(amt > 250)
					amt -= 250
					amt = SStreasury.bank_accounts[mob]
					SStreasury.give_money_treasury(250, "Recloning of [mob.real_name].")
					record_featured_stat(FEATURED_STATS_TAX_PAYERS, mob, 250)
					GLOB.vanderlin_round_stats[STATS_TAXES_COLLECTED] += 250
					spawn_loc.say("Patient recloning fee transferred successfully.", language = /datum/language/ancient_english)
			else
				spawn_loc.say("Warning; PATIENT HAS ACCOUNT, 250c DEBT MUST BE ISSUED.", language = /datum/language/ancient_english)
			O.ckey = ckey
			prefs.apply_prefs_to(O, TRUE)
			O.Unconscious(15 SECONDS)
			to_chat(usr, span_danger("Your mind is pulled automatically to your new body..!"))
			O.set_nutrition(0)
			O.set_hydration(0)
			O.apply_status_effect(/datum/status_effect/debuff/recloned)

			verbs -= /client/proc/descend

/obj/item/reagent_containers/dropper
	name = "glass dropper"
	desc = ""
	icon = 'modular_whisper/icons/misc/surgery_tools.dmi'
	icon_state = "dropper0"
	amount_per_transfer_from_this = 5
	possible_transfer_amounts = list(1, 2, 3, 4, 5)
	volume = 5
	reagent_flags = TRANSPARENT

/obj/item/reagent_containers/dropper/afterattack(obj/target, mob/user , proximity)
	. = ..()
	if(!proximity)
		return
	if(!target.reagents)
		return

	if(reagents.total_volume > 0)
		if(target.reagents.total_volume >= target.reagents.maximum_volume)
			to_chat(user, span_notice("[target] is full."))
			return

		if(!target.is_injectable(user))
			to_chat(user, span_warning("I cannot transfer reagents to [target]!"))
			return

		var/trans = 0
		var/fraction = min(amount_per_transfer_from_this/reagents.total_volume, 1)

		if(ismob(target))
			if(ishuman(target))
				var/mob/living/carbon/human/victim = target

				var/obj/item/safe_thing = victim.is_eyes_covered()

				if(safe_thing)
					if(!safe_thing.reagents)
						safe_thing.create_reagents(100)

					trans = reagents.trans_to(safe_thing, amount_per_transfer_from_this, transfered_by = user, method = TOUCH)

					target.visible_message(span_danger("[user] tries to squirt something into [target]'s eyes, but fails!"), \
											span_danger("[user] tries to squirt something into your eyes, but fails!"))

					to_chat(user, span_notice("I transfer [trans] unit\s of the solution."))
					update_icon()
					return

			target.visible_message(span_danger("[user] squirts something into [target]'s eyes!"), \
									span_danger("[user] squirts something into your eyes!"))

			reagents.reaction(target, TOUCH, fraction)
			var/mob/M = target
			var/R
			if(reagents)
				for(var/datum/reagent/A in src.reagents.reagent_list)
					R += "[A] ([num2text(A.volume)]),"

			log_combat(user, M, "squirted", R)

		trans = src.reagents.trans_to(target, amount_per_transfer_from_this, transfered_by = user)
		to_chat(user, span_notice("I transfer [trans] unit\s of the solution."))
		update_icon()

	else

		if(!target.is_drawable(user, FALSE)) //No drawing from mobs here
			to_chat(user, span_warning("I cannot directly remove reagents from [target]!"))
			return

		if(!target.reagents.total_volume)
			to_chat(user, span_warning("[target] is empty!"))
			return

		var/trans = target.reagents.trans_to(src, amount_per_transfer_from_this, transfered_by = user)

		to_chat(user, span_notice("I fill [src] with [trans] unit\s of the solution."))

		update_icon()

/obj/item/reagent_containers/dropper/update_icon()
	cut_overlays()
	if(reagents.total_volume)
		var/mutable_appearance/filling = mutable_appearance('icons/obj/reagentfillings.dmi', "dropper")
		filling.color = mix_color_from_reagents(reagents.reagent_list)
		add_overlay(filling)
	. = ..(TRUE)

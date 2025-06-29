/obj/item/dildo
	name = "unfinished dildo"
	desc = "You have to finish it first."
	icon = 'modular_stonehedge/icons/obj/lewd/dildo.dmi'
	icon_state = "unfinished"
	item_state = "dildo"
	lefthand_file = 'modular/icons/mob/inhands/lewd/items_lefthand.dmi'
	righthand_file = 'modular/icons/mob/inhands/lewd/items_righthand.dmi'
	force = 1
	throwforce = 10
	w_class = WEIGHT_CLASS_SMALL
	obj_flags = CAN_BE_HIT
	slot_flags = ITEM_SLOT_BELT
	sellprice = 1
	var/dildo_type = "human"
	var/dildo_size = "small"
	var/pleasure = 4
	var/can_custom = TRUE
	var/dildo_material
	var/shape_choice
	var/size_choice
	var/mob/living/carbon/human/wearer
	var/obj/item/organ/penis/strapon

/obj/item/dildo/New()
	. = ..()
	name = "unfinished [dildo_material] dildo"

/obj/item/dildo/attack_self(mob/living/user)
	. = ..()
	if(!istype(user))
		return
	if(can_custom)
		customize(user)

// /obj/item/dildo/equipped()
	//. = ..()
	//.internal_organs_slot[ORGAN_SLOT_PENIS] = /obj/item/organ/penis/internal

/obj/item/dildo/equipped(mob/user, slot, initial = FALSE)
	if(slot == ITEM_SLOT_BELT)
		var/mob/living/carbon/human/U = user
		if(strapon)
			var/obj/item/organ/penis/penis = U.getorganslot(ORGAN_SLOT_PENIS)
			if(!penis)
				penis = strapon
				wearer = U
				penis.Insert(U)
	. = ..()

/obj/item/dildo/proc/emptyStorage() //called when belt removed so we can use it to remove the strapon
	if(wearer) // so males who already have a penis dont get their dicks removed
		var/obj/item/organ/penis = wearer.getorganslot(ORGAN_SLOT_PENIS)
		if (penis)
			penis.Remove(wearer)

/obj/item/dildo/proc/customize(mob/living/user)
	if(!can_custom)
		return FALSE
	if(src && !user.incapacitated() && in_range(user,src))
		shape_choice = input(user, "Choose a shape for your dildo.","Dildo Shape") as null|anything in list("knotted", "human", "flared")
		if(src && shape_choice && !user.incapacitated() && in_range(user,src))
			dildo_type = shape_choice
	update_dildo_appearance()
	if(src && !user.incapacitated() && in_range(user,src))
		size_choice = input(user, "Choose a size for your dildo.","Dildo Size") as null|anything in list("small", "medium", "big", "huge")
		if(src && size_choice && !user.incapacitated() && in_range(user,src))
			dildo_size = size_choice
			switch(dildo_size)
				if("small")
					pleasure = 4
				if("medium")
					pleasure = 6
				if("big")
					pleasure = 8
				if("huge")
					pleasure = 10
	update_dildo_appearance()
	update_strapon()
	return TRUE

/obj/item/dildo/proc/update_strapon()
	var/obj/item/organ/penis/temp = new /obj/item/organ/penis
	temp.name = name
	icon_state = "dildo_[dildo_type]_[dildo_size]"
	switch(shape_choice)
		if("knotted")
			temp.penis_type = PENIS_TYPE_KNOTTED
		if("human")
			temp.penis_type = PENIS_TYPE_PLAIN
		if("flared")
			temp.penis_type = PENIS_TYPE_EQUINE
	switch(dildo_size)
		if("small")
			temp.organ_size = DEFAULT_PENIS_SIZE-1
		if("medium")
			temp.organ_size = DEFAULT_PENIS_SIZE
		if("big")
			temp.organ_size = DEFAULT_PENIS_SIZE+1
		if("huge")
			temp.organ_size = DEFAULT_PENIS_SIZE+1 //huge doesnt exist in mobs
	temp.always_hard = TRUE
	temp.strapon = TRUE
	strapon = temp

/obj/item/dildo/proc/update_dildo_appearance()
	icon_state = "dildo_[dildo_type]_[dildo_size]"
	name = "[dildo_size] [dildo_type] [dildo_material] dildo"
	if(!istype(src, /obj/item/dildo/gold) && !istype(src, /obj/item/dildo/silver) && !istype(src, /obj/item/dildo/stone) && !istype(src, /obj/item/dildo/wood) && !istype(src, /obj/item/dildo/glass)) //those will maintain desc, rest are randomized below.
		desc = pick("To quench the woman's thirst.","To kiss the lower lips.","Bane of men.","Suitable chair replacement.","Don't sit and spin, don't sit and spin, don't sit and spin...","Woman's best friend.")
	if(istype(src, /obj/item/dildo/gold))
		desc = pick("Fitting for the most royal of holes.","9 out of 10 princesses suggest this.","Kingcucker9000","Best investment ever.")
	can_custom = FALSE

/obj/item/dildo/wood
	color = "#7D4033"
	resistance_flags = FLAMMABLE
	dildo_material = "wooden"
	sellprice = 1
	desc = "Watch for splinters."

/obj/item/dildo/stone
	color = "#3f3f3f"
	dildo_material = "stone"
	sellprice = 3
	desc = "Feel the earth... It's rough around the edges."

/obj/item/dildo/iron
	color = "#909090"
	dildo_material = "iron"
	sellprice = 5

/obj/item/dildo/copper
	color = "#a86918"
	dildo_material = "copper"
	sellprice = 8

/obj/item/dildo/steel
	color = "#887e99"
	dildo_material = "steel"
	sellprice = 12

/obj/item/dildo/silver
	color = "#ffffff"
	dildo_material = "silver"
	sellprice = 30
	desc = "Not recommended for vampires and verevolves in heat."
	is_silver = TRUE

/obj/item/dildo/silver/pickup(mob/user)
	. = ..()
	var/mob/living/carbon/human/H = user
	var/datum/antagonist/vampire/lord/V_lord = H.mind.has_antag_datum(/datum/antagonist/vampire/lord)
	var/datum/antagonist/werewolf/W = H.mind.has_antag_datum(/datum/antagonist/werewolf/)
	if(ishuman(H))
		if(H.mind.has_antag_datum(/datum/antagonist/vampire) || H.mind.has_antag_datum(/datum/antagonist/vampire))
			to_chat(H, span_userdanger("The silver sizzles and burns my hand!"))
			H.adjustFireLoss(35)
		if(V_lord)
			if(!V_lord.ascended)
				to_chat(H, span_userdanger("The silver sizzles in my hand..."))
				H.adjustFireLoss(15)
		if(W && W.transformed == TRUE)
			to_chat(H, span_userdanger("The silver sizzles and burns my hand!"))
			H.adjustFireLoss(25)

/obj/item/dildo/gold
	color = "#b38f1b"
	dildo_material = "golden"
	sellprice = 50

/obj/item/dildo/glass
	color = "#9ffcff"
	dildo_material = "glass"
	sellprice = 5
	alpha = 123
	desc = "Don't break. Don't break. Don't break. Don't break."

//plug
/obj/item/dildo/plug
	name = "unfinished plug"
	desc = "You have to finish it first."
	icon = 'modular_stonehedge/icons/obj/lewd/plug.dmi'
	icon_state = "unfinished"
	item_state = "plug"
	lefthand_file = 'modular/icons/mob/inhands/lewd/items_lefthand.dmi'
	righthand_file = 'modular/icons/mob/inhands/lewd/items_righthand.dmi'

/obj/item/dildo/plug/New()
	. = ..()
	name = "unfinished [dildo_material] plug"

/obj/item/dildo/plug/customize(mob/living/user)
	if(!can_custom)
		return FALSE
	if(src && !user.incapacitated() && in_range(user,src))
		size_choice = input(user, "Choose a size for your dildo.","Dildo Size") as null|anything in list("small", "medium", "big", "huge")
		if(src && size_choice && !user.incapacitated() && in_range(user,src))
			dildo_size = size_choice
			switch(dildo_size)
				if("small")
					pleasure = 4
				if("medium")
					pleasure = 6
				if("big")
					pleasure = 8
				if("huge")
					pleasure = 10
	update_dildo_appearance()
	update_strapon()
	return TRUE

/obj/item/dildo/plug/update_dildo_appearance()
	icon_state = "plug_[dildo_size]"
	name = "[dildo_size] [dildo_material] plug"
	if(!istype(src, /obj/item/dildo/plug/gold) && !istype(src, /obj/item/dildo/plug/silver) && !istype(src, /obj/item/dildo/plug/stone) && !istype(src, /obj/item/dildo/plug/wood) && !istype(src, /obj/item/dildo/plug/glass)) //those will maintain desc, rest are randomized below.
		desc = pick("To keep a woman's contents within.","To shut a hole.","Redirector.","Suitable chair replacement.","Redirect to the correct path.","Keeps what's needed, within.")
	if(istype(src, /obj/item/dildo/plug/gold))
		desc = pick("Prevents royal accidents.","Royal hole preserver.","Shuts the wrong hole of royalty.","Best investment ever.")
	can_custom = FALSE

/obj/item/dildo/plug/update_strapon()
	var/obj/item/organ/penis/temp = new /obj/item/organ/penis
	temp.name = name
	icon_state = "plug_[dildo_size]"
	switch(dildo_size)
		if("small")
			temp.organ_size = DEFAULT_PENIS_SIZE-1
		if("medium")
			temp.organ_size = DEFAULT_PENIS_SIZE
		if("big")
			temp.organ_size = DEFAULT_PENIS_SIZE+1
		if("huge")
			temp.organ_size = DEFAULT_PENIS_SIZE+1 //huge doesnt exist in mobs
	temp.always_hard = TRUE
	temp.strapon = TRUE
	strapon = temp

/obj/item/dildo/plug/wood
	color = "#7D4033"
	resistance_flags = FLAMMABLE
	dildo_material = "wooden"
	sellprice = 1
	desc = "Watch for splinters."

/obj/item/dildo/plug/stone
	color = "#3f3f3f"
	dildo_material = "stone"
	sellprice = 3
	desc = "Same as putting a regular stone up a place, probably. Now comes in convenient shape?"

/obj/item/dildo/plug/iron
	color = "#909090"
	dildo_material = "iron"
	sellprice = 5

/obj/item/dildo/plug/copper
	color = "#a86918"
	dildo_material = "copper"
	sellprice = 8

/obj/item/dildo/plug/steel
	color = "#887e99"
	dildo_material = "steel"
	sellprice = 12

/obj/item/dildo/plug/silver
	color = "#ffffff"
	dildo_material = "silver"
	sellprice = 30
	desc = "Not recommended for vampires and verevolves in heat."
	is_silver = TRUE

/obj/item/dildo/plug/silver/pickup(mob/user)
	. = ..()
	var/mob/living/carbon/human/H = user
	var/datum/antagonist/vampire/lord/V_lord = H.mind.has_antag_datum(/datum/antagonist/vampire/lord)
	var/datum/antagonist/werewolf/W = H.mind.has_antag_datum(/datum/antagonist/werewolf/)
	if(ishuman(H))
		if(H.mind.has_antag_datum(/datum/antagonist/vampire) || H.mind.has_antag_datum(/datum/antagonist/vampire))
			to_chat(H, span_userdanger("The silver sizzles and burns my hand!"))
			H.adjustFireLoss(35)
		if(V_lord)
			if(!V_lord.ascended)
				to_chat(H, span_userdanger("The silver sizzles in my hand..."))
				H.adjustFireLoss(15)
		if(W && W.transformed == TRUE)
			to_chat(H, span_userdanger("The silver sizzles and burns my hand!"))
			H.adjustFireLoss(25)

/obj/item/dildo/plug/gold
	color = "#b38f1b"
	dildo_material = "golden"
	sellprice = 50

/obj/item/dildo/plug/glass
	color = "#9ffcff"
	dildo_material = "glass"
	sellprice = 5
	alpha = 123
	desc = "Similiar to putting a jar up where?"

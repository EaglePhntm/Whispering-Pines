/datum/mob_descriptor/age
	name = "Age"
	slot = MOB_DESCRIPTOR_SLOT_AGE
	verbage = "looks"

/datum/mob_descriptor/age/can_describe(mob/living/described)
	if(!ishuman(described))
		return FALSE
	return TRUE

/datum/mob_descriptor/age/get_description(mob/living/described)
	var/mob/living/carbon/human/human = described
	switch(human.age)
		if(AGE_OLD)
			return "old"
		if(AGE_MIDDLEAGED)
			return "middle-aged"
		if(AGE_CHILD)
			return "young"
	//ADULT and IMMORTAL
	return "of adult age"

/datum/mob_descriptor/penis
	name = "penis"
	slot = MOB_DESCRIPTOR_SLOT_PENIS
	verbage = "has"
	show_obscured = TRUE

/datum/mob_descriptor/penis/can_describe(mob/living/described)
	if(!ishuman(described))
		return FALSE
	var/mob/living/carbon/human/H = described
	var/obj/item/organ/penis/penis = H.getorganslot(ORGAN_SLOT_PENIS)
	if(!penis)
		return FALSE
	if(H.underwear)
		return FALSE
	if(!get_location_accessible(H, BODY_ZONE_PRECISE_GROIN))
		return FALSE
	return TRUE

/datum/mob_descriptor/penis/get_description(mob/living/described)
	var/mob/living/carbon/human/H = described
	var/obj/item/organ/penis/penis = H.getorganslot(ORGAN_SLOT_PENIS)
	var/adjective
	switch(penis.organ_size)
		if(1)
			adjective = "a small"
		if(2)
			adjective = "an average"
		if(3)
			adjective = "a large"
		if(4)
			adjective = "a massive"
		if(5)
			adjective = "a colossal"
	var/used_name
	if(penis.erect_state != ERECT_STATE_HARD && penis.sheath_type != SHEATH_TYPE_NONE)
		switch(penis.sheath_type)
			if(SHEATH_TYPE_NORMAL)
				if(penis.organ_size >= 3)
					used_name = "a fat sheath"
				else
					used_name = "a sheath"
			if(SHEATH_TYPE_SLIT)
				used_name = "a genital slit"
	else
		used_name = "[adjective] [penis.name]"
	return "[used_name]"

/datum/mob_descriptor/testicles
	name = "balls"
	slot = MOB_DESCRIPTOR_SLOT_TESTICLES
	verbage = "has"
	show_obscured = TRUE

/datum/mob_descriptor/testicles/can_describe(mob/living/described)
	if(!ishuman(described))
		return FALSE
	var/mob/living/carbon/human/H = described
	var/obj/item/organ/filling_organ/testicles/testes = H.getorganslot(ORGAN_SLOT_TESTICLES)
	if(!testes)
		return FALSE
	if(H.underwear)
		return FALSE
	if(!get_location_accessible(H, BODY_ZONE_PRECISE_GROIN))
		return FALSE
	var/obj/item/organ/penis/penis = H.getorganslot(ORGAN_SLOT_PENIS)
	if(penis && penis.sheath_type == SHEATH_TYPE_SLIT) //If our penis hides in a slit, dont describe testicles
		return FALSE
	return TRUE

/datum/mob_descriptor/testicles/get_description(mob/living/described)
	var/mob/living/carbon/human/H = described
	var/obj/item/organ/filling_organ/testicles/testes = H.getorganslot(ORGAN_SLOT_TESTICLES)
	var/adjective
	switch(testes.organ_size)
		if(1)
			adjective = "a small"
		if(2)
			adjective = "an average"
		if(3)
			adjective = "a large"
		if(4)
			adjective = "a massive"
		if(5)
			adjective = "a gigantic"
	return "[adjective] pair of balls"

/datum/mob_descriptor/butt
	name = "butt"
	slot = MOB_DESCRIPTOR_SLOT_BUTT
	verbage = "has"
	show_obscured = FALSE

/datum/mob_descriptor/butt/can_describe(mob/living/described)
	if(!ishuman(described))
		return FALSE
	var/mob/living/carbon/human/H = described
	var/obj/item/organ/butt/buttie = H.getorganslot(ORGAN_SLOT_BUTT)
	if(!buttie)
		return FALSE
	if(H.underwear)
		return FALSE
	if(!get_location_accessible(H, BODY_ZONE_PRECISE_GROIN))
		return FALSE
	return TRUE

/datum/mob_descriptor/butt/get_description(mob/living/described)
	var/mob/living/carbon/human/H = described
	var/obj/item/organ/butt/buttie = H.getorganslot(ORGAN_SLOT_BUTT)
	var/adjective
	switch(buttie.organ_size)
		if(1)
			adjective = "a small"
		if(2)
			adjective = "an average"
		if(3)
			adjective = "a large"
		if(4)
			adjective = "a massive"
		if(5)
			adjective = "a colossal"
	return "[adjective] ass"

/datum/mob_descriptor/vagina
	name = "vagina"
	slot = MOB_DESCRIPTOR_SLOT_VAGINA
	verbage = "has"
	show_obscured = TRUE

/datum/mob_descriptor/vagina/can_describe(mob/living/described)
	if(!ishuman(described))
		return FALSE
	var/mob/living/carbon/human/H = described
	var/obj/item/organ/filling_organ/vagina/vagina = H.getorganslot(ORGAN_SLOT_VAGINA)
	if(!vagina)
		return FALSE
	if(H.underwear)
		return FALSE
	if(!get_location_accessible(H, BODY_ZONE_PRECISE_GROIN))
		return FALSE
	return TRUE

/datum/mob_descriptor/vagina/get_description(mob/living/described)
	var/mob/living/carbon/human/H = described
	var/obj/item/organ/filling_organ/vagina/vagina = H.getorganslot(ORGAN_SLOT_VAGINA)
	var/vagina_type
	switch(vagina.accessory_type)
		if(/datum/sprite_accessory/vagina/human)
			vagina_type = "plain vagina"
		if(/datum/sprite_accessory/vagina/hairy)
			vagina_type = "hairy vagina"
		if(/datum/sprite_accessory/vagina/extrahairy)
			vagina_type = "very hairy vagina"
		if(/datum/sprite_accessory/vagina/spade)
			vagina_type = "spade vagina"
		if(/datum/sprite_accessory/vagina/furred)
			vagina_type = "furred vagina"
		if(/datum/sprite_accessory/vagina/gaping)
			vagina_type = "gaping vagina"
		if(/datum/sprite_accessory/vagina/cloaca)
			vagina_type = "cloaca"
		if(/datum/sprite_accessory/vagina/goblin)
			vagina_type = "very hairy vagina"
	return "a [vagina_type]"

/datum/mob_descriptor/breasts
	name = "breasts"
	slot = MOB_DESCRIPTOR_SLOT_BREASTS
	verbage = "has"
	show_obscured = FALSE

/datum/mob_descriptor/breasts/can_describe(mob/living/described)
	if(!ishuman(described))
		return FALSE
	var/mob/living/carbon/human/H = described
	var/obj/item/organ/filling_organ/breasts/breasts = H.getorganslot(ORGAN_SLOT_BREASTS)
	if(!breasts)
		return FALSE
	if(H.underwear)
		return FALSE
	if(!get_location_accessible(H, BODY_ZONE_CHEST))
		return FALSE
	return TRUE

/datum/mob_descriptor/breasts/get_description(mob/living/described)
	var/mob/living/carbon/human/H = described
	var/obj/item/organ/filling_organ/breasts/breasts = H.getorganslot(ORGAN_SLOT_BREASTS)
	var/adjective
	switch(breasts.organ_size)
		if(0)
			adjective = "a flat"
		if(1)
			adjective = "a very small"
		if(2)
			adjective = "a small"
		if(3)
			adjective = "an average"
		if(4)
			adjective = "a large"
		if(5)
			adjective = "an extra large"
		if(6)
			adjective = "a massive"
		if(7)
			adjective = "an enormous"
		if(8)
			adjective = "a magnificent"
		if(9)
			adjective = "a towering"
		if(10)
			adjective = "a gigantic"
		if(11)
			adjective = "a titanic"
		if(12)
			adjective = "a gargantuan"
		if(13)
			adjective = "a colossal"
		if(14)
			adjective = "a unbelieveably big"
		if(15)
			adjective = "a godly big"
		if(16)
			adjective = "a ungodly big"
	return "[adjective] pair of breasts"

/datum/mob_descriptor/belly
	name = "belly"
	slot = MOB_DESCRIPTOR_SLOT_BELLY
	verbage = "has"
	show_obscured = FALSE

/datum/mob_descriptor/belly/can_describe(mob/living/described)
	if(!ishuman(described))
		return FALSE
	var/mob/living/carbon/human/H = described
	var/obj/item/organ/belly/bellie = H.getorganslot(ORGAN_SLOT_BELLY)
	if(!bellie)
		return FALSE
	if(!get_location_accessible(H, BODY_ZONE_PRECISE_GROIN))
		return FALSE
	return TRUE


/datum/mob_descriptor/belly/get_description(mob/living/described)
	var/mob/living/carbon/human/H = described
	var/obj/item/organ/belly/bellie = H.getorganslot(ORGAN_SLOT_BELLY)
	var/adjective
	switch(bellie.organ_size)
		if(0)
			adjective = "a flat"
		if(1)
			adjective = "an average"
		if(2)
			adjective = "a large"
		if(3)
			adjective = "a massive"
	return "[adjective] belly"

//predominantly positive traits
//this file is named weirdly so that positive traits are listed above negative ones

/*
/datum/quirk/alcohol_tolerance
	name = "Alcohol Tolerance"
	desc = "Alcohol doesn't affect me much."
	value = 1
	mob_trait = TRAIT_ALCOHOL_TOLERANCE
	gain_text = span_notice("I feel like you could drink a whole keg!")
	lose_text = span_danger("I don't feel as resistant to alcohol anymore. Somehow.")
	medical_record_text = "Patient demonstrates a high tolerance for alcohol."

/datum/quirk/apathetic
	name = "Apathetic"
	desc = ""
	value = 1
	mood_quirk = TRUE
	medical_record_text = "Patient was administered the Apathy Evaluation Scale but did not bother to complete it."

/datum/quirk/apathetic/add()
	var/datum/component/mood/mood = quirk_holder.GetComponent(/datum/component/mood)
	if(mood)
		mood.mood_modifier -= 0.2

/datum/quirk/apathetic/remove()
	if(quirk_holder)
		var/datum/component/mood/mood = quirk_holder.GetComponent(/datum/component/mood)
		if(mood)
			mood.mood_modifier += 0.2

/datum/quirk/drunkhealing
	name = "Drunken Resilience"
	desc = "Alcohol helps me fight my injuries."
	value = 2
	mob_trait = TRAIT_DRUNK_HEALING
	gain_text = span_notice("I feel like a drink would do you good.")
	lose_text = span_danger("I no longer feel like drinking would ease your pain.")
	medical_record_text = "Patient has unusually efficient liver metabolism and can slowly regenerate wounds by drinking alcoholic beverages."

/datum/quirk/drunkhealing/on_process()
	var/mob/living/carbon/C = quirk_holder
	switch(C.drunkenness)
		if (6 to 40)
			C.adjustBruteLoss(-0.1, FALSE)
			C.adjustFireLoss(-0.05, FALSE)
		if (41 to 60)
			C.adjustBruteLoss(-0.4, FALSE)
			C.adjustFireLoss(-0.2, FALSE)
		if (61 to INFINITY)
			C.adjustBruteLoss(-0.8, FALSE)
			C.adjustFireLoss(-0.4, FALSE)
*/

/datum/quirk/empath
	name = "Empath"
	desc = "I can better tell the mood of those around me."
	value = 2
	mob_trait = TRAIT_EMPATH
	gain_text = span_notice("I feel in tune with those around you.")
	lose_text = span_danger("I feel isolated from others.")
	medical_record_text = "Patient is highly perceptive of and sensitive to social cues, or may possibly have ESP. Further testing needed."

/* no clowns but jesters here
/datum/quirk/fan_clown
	name = "Clown Fan"
	desc = ""
	value = 1
	mob_trait = TRAIT_FAN_CLOWN
	gain_text = span_notice("I are a big fan of the Clown.")
	lose_text = span_danger("The clown doesn't seem so great.")
	medical_record_text = "Patient reports being a big fan of the Clown."

/datum/quirk/fan_clown/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/clothing/accessory/fan_clown_pin/B = new(get_turf(H))
	var/list/slots = list (
		"backpack" = SLOT_IN_BACKPACK,
		"hands" = SLOT_HANDS,
	)
	H.equip_in_one_of_slots(B, slots , qdel_on_fail = TRUE)

/datum/quirk/fan_mime
	name = "Mime Fan"
	desc = ""
	value = 1
	mob_trait = TRAIT_FAN_MIME
	gain_text = span_notice("I are a big fan of the Mime.")
	lose_text = span_danger("The mime doesn't seem so great.")
	medical_record_text = "Patient reports being a big fan of the Mime."

/datum/quirk/fan_mime/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/clothing/accessory/fan_mime_pin/B = new(get_turf(H))
	var/list/slots = list (
		"backpack" = SLOT_IN_BACKPACK,
		"hands" = SLOT_HANDS,
	)
	H.equip_in_one_of_slots(B, slots , qdel_on_fail = TRUE)

/datum/quirk/freerunning
	name = "Kick-up"
	desc = "I can get up from being knocked down faster."
	value = 1
	mob_trait = TRAIT_KICKUP
	gain_text = span_notice("I feel lithe on my feet!")
	lose_text = span_danger("I feel clumsy again.")
	medical_record_text = "Patient scored highly on cardio tests."

/datum/quirk/friendly
	name = "Friendly"
	desc = ""
	value = 1
	mob_trait = TRAIT_FRIENDLY
	gain_text = span_notice("I want to hug someone.")
	lose_text = span_danger("I no longer feel compelled to hug others.")
	mood_quirk = TRUE
	medical_record_text = "Patient demonstrates low-inhibitions for physical contact and well-developed arms. Requesting another doctor take over this case."

/datum/quirk/jolly
	name = "Jolly"
	desc = ""
	value = 1
	mob_trait = TRAIT_JOLLY
	mood_quirk = TRUE
	medical_record_text = "Patient demonstrates constant euthymia irregular for environment. It's a bit much, to be honest."

/datum/quirk/jolly/on_process()
	if(prob(0.05))
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_STRESSEVENT, "jolly", /datum/stressevent/jolly)
*/

/datum/quirk/light_step
	name = "Light Step"
	desc = "Years of skulking about have left my steps quiet, and my hunched gait quicker."
	value = 1
	mob_trait = TRAIT_LIGHT_STEP
	gain_text = span_notice("I walk with a little more litheness.")
	lose_text = span_danger("I start tromping around like a barbarian.")
	medical_record_text = "Patient's dexterity belies a strong capacity for stealth."

/datum/quirk/light_step/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.clamped_adjust_skillrank(/datum/skill/misc/sneaking, 3, 3, TRUE)

/datum/quirk/musician
	name = "Musician"
	desc = "I am good at playing music. I've also hidden a lute!"
	value = 2
	gain_text = span_notice("I know everything about musical instruments.")
	lose_text = span_danger("I forget how musical instruments work.")
	medical_record_text = "Patient brain scans show a highly-developed auditory pathway."

/datum/quirk/musician/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.clamped_adjust_skillrank(/datum/skill/misc/music, 3, 3, TRUE)
	H.mind.special_items["Lute"] = /obj/item/instrument/lute

/datum/quirk/night_vision
	name = "Low Light Vision"
	desc = "I see a little better in the dark."
	value = 1
	gain_text = span_notice("The shadows seem a little less dark.")
	lose_text = span_danger("Everything seems a little darker.")
	medical_record_text = "Patient's eyes show above-average acclimation to darkness."

/datum/quirk/night_vision/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/organ/eyes/eyes = H.getorgan(/obj/item/organ/eyes)
	if(!eyes || eyes.lighting_alpha)
		return
	eyes.see_in_dark = 7 // Same as half-darksight eyes
	eyes.lighting_alpha = LIGHTING_PLANE_ALPHA_NV_TRAIT
	eyes.Insert(H)
/*
/datum/quirk/elvishtalker
	name = "Knows Elvish"
	desc = "I learned to speak elvish in my time here."
	value = 1

/datum/quirk/elvishtalker/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.grant_language(/datum/language/elvish)


/datum/quirk/photographer
	name = "Photographer"
	desc = ""
	value = 1
	mob_trait = TRAIT_PHOTOGRAPHER
	gain_text = span_notice("I know everything about photography.")
	lose_text = span_danger("I forget how photo cameras work.")
	medical_record_text = "Patient mentions photography as a stress-relieving hobby."

/datum/quirk/photographer/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/storage/photo_album/photo_album = new(get_turf(H))
	var/list/album_slots = list (
		"backpack" = SLOT_IN_BACKPACK,
		"hands" = SLOT_HANDS
	)
	H.equip_in_one_of_slots(photo_album, album_slots , qdel_on_fail = TRUE)
	photo_album.persistence_id = "personal_[H.mind.key]" // this is a persistent album, the ID is tied to the account's key to avoid tampering
	photo_album.persistence_load()
	photo_album.name = "[H.real_name]'s photo album"
	var/obj/item/camera/camera = new(get_turf(H))
	var/list/camera_slots = list (
		"neck" = SLOT_NECK,
		"left pocket" = SLOT_L_STORE,
		"right pocket" = SLOT_R_STORE,
		"backpack" = SLOT_IN_BACKPACK,
		"hands" = SLOT_HANDS
	)
	H.equip_in_one_of_slots(camera, camera_slots , qdel_on_fail = TRUE)
	H.regenerate_icons()

/datum/quirk/selfaware
	name = "Self-Aware"
	desc = "I know the extent of my wounds to a terrifying scale."
	value = 1
	mob_trait = TRAIT_SELF_AWARE
	medical_record_text = "Patient demonstrates an uncanny knack for self-diagnosis."

/datum/quirk/skittish
	name = "Skittish"
	desc = "I can leap into things to hide."
	value = 2
	mob_trait = TRAIT_SKITTISH
	medical_record_text = "Patient demonstrates a high aversion to danger and has described hiding in containers out of fear."

/datum/quirk/spiritual
	name = "Spiritual"
	desc = "I have extraordinary faith in the gods."
	value = 1
	mob_trait = TRAIT_SPIRITUAL
	gain_text = span_notice("I have faith in a higher power.")
	lose_text = span_danger("I lose faith!")
	medical_record_text = "Patient reports a belief in a higher power."

/datum/quirk/spiritual/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.equip_to_slot_or_del(new /obj/item/storage/fancy/candle_box(H), SLOT_IN_BACKPACK)

/datum/quirk/tagger
	name = "Tagger"
	desc = ""
	value = 1
	mob_trait = TRAIT_TAGGER
	gain_text = span_notice("I know how to tag walls efficiently.")
	lose_text = span_danger("I forget how to tag walls properly.")
	medical_record_text = "Patient was recently seen for possible paint huffing incident."

/datum/quirk/tagger/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/toy/crayon/spraycan/spraycan = new(get_turf(H))
	H.put_in_hands(spraycan)
	H.equip_to_slot(spraycan, SLOT_IN_BACKPACK)
	H.regenerate_icons()

//useless
/datum/quirk/voracious
	name = "Voracious"
	desc = "I feel hungrier than most."
	value = 1
	mob_trait = TRAIT_VORACIOUS
	gain_text = span_notice("I feel HONGRY.")
	lose_text = span_danger("I no longer feel HONGRY.")
*/

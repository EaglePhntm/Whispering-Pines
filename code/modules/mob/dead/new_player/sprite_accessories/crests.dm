/datum/sprite_accessory/crests
	abstract_type = /datum/sprite_accessory/crests
	layer = HAIR_LAYER
	icon = 'icons/mob/sprite_accessory/crests/crests.dmi'
	default_colors = list("#FFFFFF")

/datum/sprite_accessory/crests/adjust_appearance_list(list/appearance_list, obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	generic_gender_feature_adjust(appearance_list, organ, bodypart, owner, OFFSET_FACE)

/datum/sprite_accessory/crests/rubyb
	name = "ruby-Brass Crest"
	icon_state = "rubyb"

/datum/sprite_accessory/crests/ironc
	name = "Iron Crown Crest"
	icon_state = "ironc"

/datum/sprite_accessory/crests/bronzer
	name = "Bronze Rune Crest"
	icon_state = "bronzer"

/datum/sprite_accessory/crests/steelt
	name = "Steel Thorn Crest"
	icon_state = "steelt"

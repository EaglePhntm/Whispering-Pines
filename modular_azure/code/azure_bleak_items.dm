
/datum/supply_pack/wardrobe/suits/exoticsilkbra
	name = "Exotic Silks"
	cost = 100
	contains = list(
					/obj/item/clothing/shirt/exoticsilkbra,
					/obj/item/clothing/face/exoticsilkmask,
					/obj/item/clothing/shoes/anklets,
					/obj/item/storage/belt/leather/exoticsilkbelt,
				)

/obj/item/clothing/shoes/anklets
	name = "golden anklets"
	icon = 'modular_azure/icons/clothing/feet.dmi'
	mob_overlay_icon = 'modular_azure/icons/clothing/onmob/feet.dmi'
	desc = "Luxurious anklets made of the finest gold. They leave the feet bare while adding an exotic flair."
	gender = PLURAL
	icon_state = "anklets"
	item_state = "anklets"
	is_barefoot = TRUE
	sewrepair = TRUE
	armor = list("blunt" = 5, "slash" = 5, "stab" = 5, "piercing" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/face/exoticsilkmask
	name = "exotic silk mask"
	icon_state = "exoticsilkmask"
	icon = 'modular_azure/icons/clothing/masks.dmi'
	mob_overlay_icon = 'modular_azure/icons/clothing/onmob/masks.dmi'
	flags_inv = HIDEFACE|HIDEFACIALHAIR
	body_parts_covered = NECK|MOUTH
	slot_flags = ITEM_SLOT_MASK|ITEM_SLOT_HIP
	sewrepair = TRUE

/obj/item/clothing/face/blindfold
	name = "blindfold"
	desc = "A strip of cloth tied around the eyes to block vision."
	icon_state = "clothblindfold"
	item_state = "clothblindfold"
	icon = 'modular_azure/icons/clothing/masks.dmi'
	mob_overlay_icon = 'modular_azure/icons/clothing/onmob/masks.dmi'
	flags_inv = HIDEFACE
	body_parts_covered = EYES
	sewrepair = TRUE
	tint = 3

/obj/item/clothing/face/blindfold/equipped(mob/living/carbon/human/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_MASK)
		user.become_blind("blindfold_[REF(src)]")

/obj/item/clothing/face/blindfold/dropped(mob/living/carbon/human/user)
	..()
	user.cure_blind("blindfold_[REF(src)]")

/obj/item/clothing/shirt/exoticsilkbra
	name = "exotic silk bra"
	desc = "An exquisite bra crafted from the finest silk and adorned with gold rings. It leaves little to the imagination."
	icon = 'modular_azure/icons/clothing/shirts.dmi'
	mob_overlay_icon = 'modular_azure/icons/clothing/onmob/shirts.dmi'
	icon_state = "exoticsilkbra"
	item_state = "exoticsilkbra"
	body_parts_covered = CHEST
	boobed = TRUE
	sewrepair = TRUE
	flags_inv = null
	slot_flags = ITEM_SLOT_SHIRT
	flags_inv = HIDECROTCH
	mob_overlay_icon = 'modular_azure/icons/clothing/onmob/shirts.dmi'
	boobed = TRUE

/obj/item/storage/belt/leather/exoticsilkbelt
	name = "exotic silk belt"
	desc = "A gold adorned belt with the softest of silks barely concealing one's bits."
	icon_state = "exoticsilkbelt"
	var/max_storage = 5
	sewrepair = TRUE

//recipes

/datum/anvil_recipe/sewing/goldanklet
	name = "exotic silk anklets"
	req_bar =  /obj/item/ingot/gold
	created_item = list (/obj/item/clothing/shoes/anklets)
	craftdiff = 6

/datum/crafting_recipe/sewing/exoticsilkbra
	name = "exotic silk bra - (4 silk, 1 gold ring; MASTER)"
	result = list (/obj/item/clothing/shirt/exoticsilkbra)
	reqs = list(/obj/item/natural/silk = 3,
				/obj/item/clothing/ring/gold = 1)
	craftdiff = 6

/datum/crafting_recipe/sewing/anklets
	name = "exotic silk anklets - (3 silk, 1 gold ring; MASTER)"
	result = list (/obj/item/clothing/shoes/anklets)
	reqs = list(/obj/item/natural/silk = 3,
				/obj/item/clothing/ring/gold = 1)
	craftdiff = 6

/datum/crafting_recipe/sewing/exoticsilkbelt
	name = "exotic silk belt - (3 silk, 1 gold ring; MASTER)"
	result = list (/obj/item/storage/belt/leather/exoticsilkbelt)
	reqs = list(/obj/item/natural/silk = 3,
				/obj/item/clothing/ring/gold = 1)
	craftdiff = 6

/datum/crafting_recipe/sewing/exoticsilkmask
	name = "exotic silk mask - (3 silk, 1 gold ring; MASTER)"
	result = list (/obj/item/clothing/face/exoticsilkmask)
	reqs = list(/obj/item/natural/silk = 3,
				/obj/item/clothing/ring/gold = 1)
	craftdiff = 6

/obj/item/clothing/shirt/dress/gen/strapless
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	body_parts_covered = CHEST|GROIN
	icon = 'modular_hearthstone/icons/obj/items/clothes/dress.dmi'
	mob_overlay_icon = 'modular_hearthstone/icons/obj/items/clothes/on_mob/dress.dmi'
	name = "strapless dress"
	desc = "It barely covers anything at all!"
	flags_inv = HIDEBOOB|HIDEBELLY|HIDECROTCH
	icon_state = "strapless"
	sleevetype = null
	sleeved = null
	genital_access = TRUE

//COLORS

/obj/item/clothing/shirt/dress/gen/strapless/black
	color = CLOTHING_SOOT_BLACK

/obj/item/clothing/shirt/dress/gen/strapless/blue
	color = CLOTHING_MAGE_BLUE

/obj/item/clothing/shirt/dress/gen/strapless/purple
	color = "#664357"

/obj/item/clothing/shirt/dress/gen/strapless/red
	color = "#6F0000"

/obj/item/clothing/shirt/dress/gen/strapless/random/Initialize()
	color = pick(CLOTHING_SOOT_BLACK, CLOTHING_MAGE_BLUE, "#664357", "#6F0000")
	..()

/obj/item/clothing/shirt/dress/gen/strapless/alt
	mob_overlay_icon = 'modular_hearthstone/icons/obj/items/clothes/on_mob/dress.dmi'
	name = "strapless dress"
	desc = "It barely covers anything at all!"
	flags_inv = HIDEBOOB|HIDEBELLY|HIDECROTCH
	icon_state = "strapless2"
	icon = 'modular_hearthstone/icons/obj/items/clothes/dress.dmi'


//SUPPLY

/datum/supply_pack/rogue/wardrobe/suits/strapless_dress_black
	name = "Black Strapless Dresses"
	cost = 10
	contains = list(
					/obj/item/clothing/shirt/dress/gen/strapless/black,
					/obj/item/clothing/shirt/dress/gen/strapless/black,
				)

/datum/supply_pack/rogue/wardrobe/suits/strapless_dress_blue
	name = "Blue Strapless Dresses"
	cost = 10
	contains = list(
					/obj/item/clothing/shirt/dress/gen/strapless/blue,
					/obj/item/clothing/shirt/dress/gen/strapless/blue,
				)

/datum/supply_pack/rogue/wardrobe/suits/strapless_dress_red
	name = "Red Strapless Dresses"
	cost = 10
	contains = list(
					/obj/item/clothing/shirt/dress/gen/strapless/red,
					/obj/item/clothing/shirt/dress/gen/strapless/red,
				)

/datum/supply_pack/rogue/wardrobe/suits/strapless_dress_purple
	name = "Purple Strapless Dresses"
	cost = 10
	contains = list(
					/obj/item/clothing/shirt/dress/gen/strapless/purple,
					/obj/item/clothing/shirt/dress/gen/strapless/purple,
				)

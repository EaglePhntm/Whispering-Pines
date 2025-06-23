/obj/item/clothing/pants/chainlegs/iron/fishnet
	name = "iron chain fishnets"
	desc = "A legwear of chain interwoven."
	icon = 'modular_hearthstone/icons/obj/items/clothes/stockings.dmi'
	mob_overlay_icon = 'modular_hearthstone/icons/obj/items/clothes/on_mob/stockings.dmi'
	icon_state = "fishnet"
	color = "#9EA48E"
	flags_inv = null
	genital_access = TRUE

/obj/item/clothing/pants/chainlegs/fishnet
	name = "steel chain fishnets"
	desc = "A legwear of chain interwoven."
	icon = 'modular_hearthstone/icons/obj/items/clothes/stockings.dmi'
	mob_overlay_icon = 'modular_hearthstone/icons/obj/items/clothes/on_mob/stockings.dmi'
	icon_state = "fishnet"
	color = "#9BADB7"
	flags_inv = null
	genital_access = TRUE

//RECIPES

/datum/anvil_recipe/armor/chainfishnet
	name = "Chain Fishnet"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/pants/chainlegs/fishnet
	i_type = "Armor"

/datum/anvil_recipe/armor/ichainfishnet
	name = "Chain Fishnet"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/pants/chainlegs/iron/fishnet
	i_type = "Armor"

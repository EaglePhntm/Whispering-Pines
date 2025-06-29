GLOBAL_LIST_INIT(named_penis_sizes, list(
	"small" = 1,
	"average" = 2,
	"large" = 3,
))

//unselectables included.
GLOBAL_LIST_INIT(uns_named_penis_sizes, list(
	"small" = 1,
	"average" = 2,
	"large" = 3,
	"massive" = 4,
	"enormous" = 5,
))

//6 cant be selected, dont have sprite but used when you put salami in your pants.
GLOBAL_LIST_INIT(named_ball_sizes, list(
	"small" = 1,
	"average" = 2,
	"large" = 3,
))

//unselectables included.
GLOBAL_LIST_INIT(uns_named_ball_sizes, list(
	"small" = 1,
	"average" = 2,
	"large" = 3,
	"massive" = 4,
	"enormous" = 5,
	"gigantic" = 6,
))

GLOBAL_LIST_INIT(named_breast_sizes, list(
	"flat" = 0,
	"very small" = 1,
	"small" = 2,
	"normal" = 3,
	"large" = 4,
	"extra large" = 5,
	"massive" = 6,
	"enormous" = 7,
	"towering" = 8,
	"magnificent" = 9,
	"gigantic" = 10,
	"titanic" = 11,
	"gargantuan" = 12,
	"colossal" = 13,
))

//unselectables included.
GLOBAL_LIST_INIT(uns_named_breast_sizes, list(
	"flat" = 0,
	"very small" = 1,
	"small" = 2,
	"normal" = 3,
	"large" = 4,
	"extra large" = 5,
	"massive" = 6,
	"enormous" = 7,
	"towering" = 8,
	"magnificent" = 9,
	"gigantic" = 10,
	"titanic" = 11,
	"gargantuan" = 12,
	"colossal" = 13,
	"unbelieveably big" = 14,
	"godly big" = 15,
	"ungodly big" = 16,
))


GLOBAL_LIST_INIT(named_belly_sizes, list(
	"flat" = 0,
	"small" = 1,
	"medium" = 2,
	"large" = 3,
))

GLOBAL_LIST_INIT(named_butt_sizes, list(
	"flat" = 0,
	"small" = 1,
	"medium" = 2,
	"large" = 3,
	"massive" = 4,
))

//unselectables included.
GLOBAL_LIST_INIT(uns_named_butt_sizes, list(
	"flat" = 0,
	"small" = 1,
	"medium" = 2,
	"large" = 3,
	"massive" = 4,
	"enormous" = 5,
))

GLOBAL_LIST_INIT(customizer_choices, build_customizer_choices())
GLOBAL_LIST_INIT(customizers, build_customizers())

/proc/build_customizer_choices()
	. = list()
	for(var/type in typesof(/datum/customizer_choice))
		if(is_abstract(type))
			continue
		.[type] = new type()
	return .

/proc/build_customizers()
	. = list()
	for(var/type in typesof(/datum/customizer))
		if(is_abstract(type))
			continue
		.[type] = new type()
	return .

/proc/color_pick_sanitized_lumi(mob/user, description, title, default_value, min_lumi = 0.07, max_lumi = 1.0)
	var/color = input(user, description, title, default_value) as color|null
	if(!color)
		return
	color = sanitize_hexcolor(color)
	var/list/hsl = rgb2hsl(hex2num(copytext(color,1,3)),hex2num(copytext(color,3,5)),hex2num(copytext(color,5,7)))
	var/lumi = hsl[3]
	if(lumi < min_lumi)
		to_chat(user, "<span class='warning'>The picked color is too dark!</span>")
		return
	if(lumi > max_lumi)
		to_chat(user, "<span class='warning'>The picked color is too bright!</span>")
		return
	return color


/proc/color_pick_sanitized(mob/user, description, title, default_value, min_lumi = 0.07, max_lumi = 1.0)
	var/color = input(user, description, title, default_value) as color|null
	if(!color)
		return
	color = sanitize_hexcolor(color)
	return color

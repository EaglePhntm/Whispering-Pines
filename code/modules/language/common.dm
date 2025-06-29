// 'basic' language; spoken by default.
/datum/language/common
	name = "Common"
	desc = ""
	speech_verb = "says"
	whisper_verb = "whispers"
	exclaim_verb = "yells"
	ask_verb = "asks"
	key = "i"
	flags = LANGUAGE_HIDE_ICON_IF_UNDERSTOOD
	default_priority = 100
	space_chance = 20
	sentence_chance = 0
	between_word_sentence_chance = 10
	between_word_space_chance = 75
	additional_syllable_low = 0
	additional_syllable_high = 0
	icon_state = "imperial"

//Syllable Lists
/*
	This list really long, mainly because I can't make up my mind about which mandarin syllables should be removed,
	and the english syllables had to be duplicated so that there is roughly a 50-50 weighting.

	Sources:
	http://www.sttmedia.com/syllablefrequency-english
	http://www.chinahighlights.com/travelguide/learning-chinese/pinyin-syllables.htm
*/
/datum/language/common/syllables = list(
"ant",
"ati",
"atu",
"bus",
"con",
"cum",
"ent",
"era",
"ere",
"eri",
"est",
"iam",
"ibu",
"ili",
"iss",
"ita",
"itu",
"ium",
"ius",
"nte",
"nti",
"oru",
"per",
"pro",
"qua",
"que",
"qui",
"quo",
"rat",
"rum",
"sse",
"tat",
"ter",
"tis",
"tum",
"tur",
"tus",
"unt",
"ae",
"am",
"an",
"ar",
"at",
"ci",
"co",
"de",
"di",
"em",
"en",
"er",
"es",
"et",
"ia",
"in",
"is",
"it",
"iu",
"li",
"ne",
"ni",
"nt",
"on",
"or",
"os",
"pe",
"qu",
"ra",
"re",
"ri",
"ru",
"se",
"si",
"st",
"ta",
"te",
"ti",
"tu",
"ue",
"ui",
"um",
"ur",
"us")

/datum/language/ancient_english
	name = "Ancient English"
	desc = ""
	speech_verb = "says"
	whisper_verb = "whispers"
	exclaim_verb = "yells"
	ask_verb = "asks"
	key = "n"
	space_chance = 20 //very high due to the potential length of each syllable
	sentence_chance = 20
	between_word_sentence_chance = 5
	between_word_space_chance = 95
	additional_syllable_low = -1
	additional_syllable_high = 0
	default_priority = 80
	icon_state = "drone"
	syllables = list(
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

	mutual_understanding = list(
		/datum/language/common = 20,
	)

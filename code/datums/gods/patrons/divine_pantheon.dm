/datum/patron/divine
	name = null
	associated_faith = /datum/faith/divine_pantheon
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal

/datum/patron/divine/can_pray(mob/living/follower)
	//you can pray anywhere inside a church
	if(istype(get_area(follower), /area/rogue/indoors/town/church))
		return TRUE

	for(var/obj/structure/fluff/psycross/cross in view(4, get_turf(follower)))
		if(!cross.obj_broken)
			return TRUE

	to_chat(follower, span_danger("I need a nearby Pantheon Cross for my prayers to be heard..."))
	return FALSE

/* ----------------- */

/datum/patron/divine/astrata
	name = "Astrata"
	domain = "Goddess of Order, the Sun Queen"
	desc = "Crafted from the head of Psydon, twin of Lunaria. She gifted mankind the Sun, protecting Psydonia from all forces which may seek it harm: from both outside and within."
	flaws = "Tyrannical, Ill-Tempered, Uncompromising"
	worshippers = "Nobles, Zealots, Commoners"
	sins = "Betrayal, Sloth, Witchcraft"
	boons = "Your stamina regeneration delay is lowered during daytime."
	added_traits = list(TRAIT_APRICITY)
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t1 = /obj/effect/proc_holder/spell/invoked/sacred_flame_rogue
	t2 = /obj/effect/proc_holder/spell/invoked/heal
	t3 = /obj/effect/proc_holder/spell/invoked/revive
	confess_lines = list(
		"ASTRATA IS MY LIGHT!",
		"ASTRATA BRINGS LAW!",
		"I SERVE THE GLORY OF THE SUN!",
	)
	storyteller = /datum/storyteller/astrata

/datum/patron/divine/lunaria
	name = "Lunaria"
	domain = "Goddess of Moon, Moonlight and Clarity."
	desc = "New goddess of night and moon, Said to be the one who gifted mankind with arcane knowledge and affinity of magic after her becoming of a new god. Her flowing hair looks as white as snow and her face divine. Those cold crystal clear eyes are a glowing icey blue  and such seems to be the theme for her body, cold, lithe, yet powerful. She has modest assets for a divine being of this world at least compared to everything else that exists. She appears consistently nude... Lady Moonbeam is her best friend."
	flaws = "Exhibitionism, Isolationism, Unfiltered Honesty"
	worshippers = "Magic Practitioners, Scholars, Scribes"
	sins = "Suppressing Truth, Doing drugs."
	boons = "You enjoy night time more than others."
	added_traits = list(TRAIT_NIGHT_OWL)
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t1 = /obj/effect/proc_holder/spell/invoked/invisibility
	t2 = /obj/effect/proc_holder/spell/invoked/blindness/miracle
	t3 = /obj/effect/proc_holder/spell/invoked/projectile/moondagger
	confess_lines = list(
		"LUNARIA IS NIGHT!",
		"LUNARIA SEES THE TRUTH!",
		"I SEEK THE MYSTERIES OF THE MOON!",
	)
	storyteller = /datum/storyteller/lunaria

/datum/patron/divine/blissrose
	name = "Blissrose"
	domain = "God of the forest and nature."
	desc = "Blissrose the Plantmother,The first plantoid to ever exist, created by radiation mutating a certain narcotic plant, Blissrose is almost solely responsible for recovery of the world to be the 'new world' over raping (sometimes consensually mating) survivors for centuries, using the produced seeds to regrow whole forests in time, also mother or grandmother of -all- the rare plantpeople, taled to control the whole world's forests for this reason, she was considered powerful and significant enough to be a 'deity'. She represents instincts, animalism and true nature with her actions, generally worshipped and praised for everything the forest offers, as they all came from her in the end, causing travelers to sometimes leave gifts at the nudist village in heart of the forest."
	flaws = "Animalism, Uncivilization, Disorderliness"
	worshippers = "Druids, Beasts, Farmers"
	sins = "Deforestation, Overhunting, Disrespecting Nature"
	boons = "You are immune to kneestingers, and drug overdoses."
	added_traits = list(TRAIT_KNEESTINGER_IMMUNITY, TRAIT_CRACKHEAD)
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t1 = /obj/effect/proc_holder/spell/targeted/blesscrop
	t2 = /obj/effect/proc_holder/spell/self/beastsense
	t3 = /obj/effect/proc_holder/spell/targeted/beasttame
	confess_lines = list(
		"BLISSROSE PROVIDES!",
		"THE PLANTMOTHER BRINGS BOUNTY!",
		"I ANSWER THE CALL OF THE WILD!",
	)
	storyteller = /datum/storyteller/blissrose

/datum/patron/divine/abyssor
	name = "Abyssor"
	domain = "God of Seas and Storms"
	desc = "Crafted from the blood of Psydon as sovereign of the waters. Enraged by ignorance of Him from followers of New gods."
	flaws= "Reckless, Stubborn, Destructive"
	worshippers = "Sailors of the Sea and Sky, Horrid Sea-Creachers, Fog Islanders"
	sins = "Fear, Hubris, Forgetfulness"
	boons = "Leeches will drain very little of your blood."
	added_traits = list(TRAIT_LEECHIMMUNE)
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t1 = /obj/effect/proc_holder/spell/invoked/projectile/swordfish
	t2 = /obj/effect/proc_holder/spell/self/summon_trident
	t3 = /obj/effect/proc_holder/spell/invoked/ocean_embrace
	confess_lines = list(
		"ABYSSOR COMMANDS THE WAVES!",
		"THE OCEAN'S FURY IS ABYSSOR'S WILL!",
		"I AM DRAWN BY THE PULL OF THE TIDE!",
	)
	storyteller = /datum/storyteller/abyssor

/datum/patron/divine/last_death
	name = "Last Death"
	domain = "Death, Souls, Afterlife, Necromancy"
	desc = "The Kin-Killer, After the Holy War which created the universe out of it's ashes and fire. After only a handful of the ancient gods being left, He picked them off one by one to kill who he found old minded for a new time. It's said they forced old Goddess of Life in blade-point to give life to his undead creations, making an abomination at first.. half undead half living beings that gave birth to fully living 'resurgentis' in time."
	flaws = "Pessimistic, Wrathful"
	worshippers = "Resurgentis, Gravetenders, Mourners, Clerical Necromancers"
	sins = "Heretical Magic, Untimely Death, Disturbance of Rest unless for service of him."
	boons = "You may see the presence of a soul in a body and eat raw meat."
	added_traits = list(TRAIT_SOUL_EXAMINE, TRAIT_ORGAN_EATER)
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t1 = /obj/effect/proc_holder/spell/targeted/burialrite
	t2 = /obj/effect/proc_holder/spell/targeted/soulspeak
	t3 = /obj/effect/proc_holder/spell/targeted/churn
	confess_lines = list(
		"ALL SOULS FIND THEIR WAY TO THE LAST DEATH!",
		"THE UNNAMED IS OUR FINAL REPOSE!",
		"I FEAR NOT DEATH, HE AWAITS!",
	)
	storyteller = /datum/storyteller/last_death

/datum/patron/divine/wanderer
	name = "Wanderer"
	domain = "God of the Desert, Travel, and Leadership"
	desc = "The Nomad King. Before his acension to godhood the wanderer was a blind human, gifted with astral sight which he used to guide his tribe through the desert. \
He grew to lead the tribe completely as he never lost his way in the eternal dunes, more and more flocked to him as he found water when all was dry and \
shelter when the sands flew.  Eventualy he held complete dominance over all the desert tribes and \
formed Crater city, a place for all nomads to come and rest from the harsh deserts.  His death by what \
most assume to be natural causes along with his near diefication by his followers lead him to \
accend to the astral plane as the god of the desert where he has watched over all who dwell there, even as evil creeps into his domain."
	flaws = "Carelessness, Aggression, Pride"
	worshippers = "Nomads, Leaders, Tribals"
	sins = "Tyranny, Cruelty, Stagnation"
	boons = "Your used weapons dull slower."
	added_traits = list(TRAIT_SHARPER_BLADES)
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t1 = /obj/effect/proc_holder/spell/self/call_to_arms
	t2 = /obj/effect/proc_holder/spell/self/divine_strike
	t3 = /obj/effect/proc_holder/spell/invoked/persistence
	confess_lines = list(
		"WANDERER GUIDE ME!",
		"BURNING SAND AGAINST MY SKIN!",
		"WANDERER PROTECTS!",
	)
	storyteller = /datum/storyteller/wanderer

/datum/patron/divine/xylix
	name = "Xylix"
	domain = "Diety of Trickery, Freedom, and Inspiration"
	desc = "Crafted from the silver tongue of Psydon. Xylix is a force of change and deceit, yet allows little known of their gender let alone presence."
	flaws = "Petulance, Deception, Gambling-Prone"
	worshippers = "Cheats, Performers, The Hopeless"
	sins = "Boredom, Predictability, Routine"
	boons = "You can rig different forms of gambling in your favor."
	added_traits = list(TRAIT_BLACKLEG)
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t1 = /obj/effect/proc_holder/spell/invoked/vicious_mimicry
	t2 = /obj/effect/proc_holder/spell/invoked/wheel
	confess_lines = list(
		"ASTRATA IS MY LIGHT!",
		"LUNARIA IS NIGHT!",
		"BLISSROSE PROVIDES!",
		"ABYSSOR COMMANDS THE WAVES!",
		"WANDERER IS JUSTICE!",
		"ALL SOULS FIND THEIR WAY TO LAST DEATH!",
		"HAHAHAHA! AHAHAHA! HAHAHAHA!", //the only xylix-related confession
		"PESTRA SOOTHES ALL ILLS!",
		"MALUM IS MY FORGE!",
		"MOONBEAM BRINGS US TOGETHER!",
	)
	storyteller = /datum/storyteller/xylix

/datum/patron/divine/pestra
	name = "Pestra"
	domain = "Goddess of Disease, Alchemy, and Medicine"
	desc = "Crafted from Psydon's intestines left behind. She slithered out, bringing forth the cycle of life and decay."
	flaws = "Drunkenness, Crudeness, Irresponsibility"
	worshippers = "The Ill and Infirm, Alchemists, Physicians"
	sins = "´Curing´ Abnormalities, Refusing to Help Unfortunates, Groveling"
	boons = "You may consume rotten food without being sick."
	added_traits = list(TRAIT_ROT_EATER)
	t0 = /obj/effect/proc_holder/spell/invoked/diagnose
	t1 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t2 = /obj/effect/proc_holder/spell/invoked/attach_bodypart
	t3 = /obj/effect/proc_holder/spell/invoked/cure_rot
	confess_lines = list(
		"PESTRA SOOTHES ALL ILLS!",
		"DECAY IS A CONTINUATION OF LIFE!",
		"MY AFFLICTION IS MY TESTAMENT!",
	)
	storyteller = /datum/storyteller/pestra

/datum/patron/divine/malum
	name = "Malum"
	domain = "God of Toil, Innovation, and Creation"
	desc = "Crafted from the hands of Psydon. He would later use his own to construct wonderous inventions."
	flaws = "Obsessive, Exacting, Overbearing"
	worshippers = "Smiths, Miners, Sculptors"
	sins = "Cheating, Shoddy Work, Suicide"
	boons = "You recover more energy when sleeping."
	added_traits = list(TRAIT_BETTER_SLEEP)
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t1 = /obj/effect/proc_holder/spell/invoked/vigorouscraft
	t2 = /obj/effect/proc_holder/spell/invoked/hammerfall
	t3 = /obj/effect/proc_holder/spell/invoked/heatmetal
	confess_lines = list(
		"MALUM IS MY FORGE!",
		"TRUE VALUE IS IN THE TOIL!",
		"I AM AN INSTRUMENT OF CREATION!",
	)
	storyteller = /datum/storyteller/malum

/datum/patron/divine/moonbeam
	name = "Lady Moonbeam"
	domain = "Goddess of Dreams, Illusion, Pleasure."
	desc = "The Dream Goddess. Initially a human psion, she named herself 'Lady Moonbeam', as her favorite thing in the mortal world that didn't leave her until her death. Eventually finding what's remaining of an old god in the astral plane with still strange traces of lewd energy... she takes it, being filled with all of the universe's secrets without -fully- losing her mind. She returned to the astral plane and began building her astral 'dreamland' empire out of people's sweetest dreams... Or wet, whatever pleases the wandering dreamer... she remains a bodiless, astral form taking on an ever-changing cosmic body when she must be seen. Often not speaking, but showing, finding that easier to express herself, her forms often have no mouth, but white glowing wide eyes to take attention, Her most common appearance would be that of a female humanoid shaped pattern of stars and cosmos with flowing hair. Lunaria is her best friend."
	flaws= "Naivete, Impulsiveness, Slight madness, libido"
	worshippers = "Mothers, Illusionists, Dreamers, Married Couples"
	sins = "Sadism, Abandonment, Spreading illness purposefully."
	boons = "You can understand others' needs better. You are better in bed and Clerics gain devotion through it."
	added_traits = list(TRAIT_EXTEROCEPTION, TRAIT_GOODLOVER, TRAIT_SEXDEVO)
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t1 = /obj/effect/proc_holder/spell/invoked/instill_perfection
	t2 = /obj/effect/proc_holder/spell/invoked/projectile/eoracurse
	t3 = /obj/effect/proc_holder/spell/invoked/bud
	confess_lines = list(
		"TAKE ME TO YOUR ASTRAL EMBRACE!",
		"LADY MOONBEAM, WAKE ME FROM THIS BAD DREAM!",
		"LIFE IS INVALUABLE!",
	)
	storyteller = /datum/storyteller/moonbeam

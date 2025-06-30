/datum/job/churchling
	title = "Churchling"
	tutorial = "Your family were zealots. \
	They scolded you with a studded belt and prayed like sinners \
	every waking hour of the day they weren’t toiling in the fields. \
	You escaped them by becoming a churchling-- and a guaranteed education isn't so bad."
	flag = CHURCHLING
	department_flag = YOUNGFOLK
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_CHURCHLING
	faction = FACTION_TOWN
	total_positions = 2
	spawn_positions = 2
	min_pq = -10
	bypass_lastclass = TRUE

	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_CHILD)
	allowed_races = RACES_PLAYER_ALL
	allowed_patrons = ALL_TEMPLE_PATRONS

	outfit = /datum/outfit/job/churchling
	give_bank_account = TRUE
	can_have_apprentices = FALSE
	cmode_music = 'sound/music/cmode/towner/CombatTowner.ogg'

/datum/outfit/job/churchling
	name = "Churchling"
	jobtype = /datum/job/churchling
	allowed_patrons = ALL_TEMPLE_PATRONS
	job_bitflag = BITFLAG_CHURCH

/datum/outfit/job/churchling/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
		H.adjust_skillrank(/datum/skill/misc/sneaking, 4, TRUE)
		H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	if(H.gender == FEMALE)
		head = /obj/item/clothing/head/armingcap
		armor = /obj/item/clothing/shirt/dress/gen/random
		shirt = /obj/item/clothing/shirt/undershirt
	else
		armor = /obj/item/clothing/shirt/robe
		shirt = /obj/item/clothing/shirt/undershirt
	pants = /obj/item/clothing/pants/tights
	belt = /obj/item/storage/belt/leather/rope
	shoes = /obj/item/clothing/shoes/simpleshoes
	beltl = /obj/item/storage/keyring/priest
	neck = /obj/item/clothing/neck/psycross/silver
	switch(H.patron?.type)
		if(/datum/patron/divine/asteria)
			neck = /obj/item/clothing/neck/psycross/silver/asteria
		if(/datum/patron/divine/last_death) //last_death acolytes are now gravetenders
			neck = /obj/item/clothing/neck/psycross/silver/last_death
		if(/datum/patron/divine/moonbeam)
			neck = /obj/item/clothing/neck/psycross/silver/moonbeam
		if(/datum/patron/divine/lunaria)
			neck = /obj/item/clothing/neck/psycross/lunaria
		if(/datum/patron/divine/pestra)
			neck = /obj/item/clothing/neck/psycross/silver/pestra
		if(/datum/patron/divine/blissrose)
			neck = /obj/item/clothing/neck/psycross/silver/blissrose
		if(/datum/patron/divine/abyssor)
			neck = /obj/item/clothing/neck/psycross/silver/abyssor
		if(/datum/patron/divine/wanderer)
			neck = /obj/item/clothing/neck/psycross/silver/wanderer
		if(/datum/patron/divine/xylix)
			neck = /obj/item/clothing/neck/psycross/silver/xylix
		if(/datum/patron/divine/malum)
			neck = /obj/item/clothing/neck/psycross/silver/malum

	H.change_stat(STATKEY_PER, 1)
	H.change_stat(STATKEY_SPD, 2)

	var/datum/devotion/cleric_holder/C = new /datum/devotion/cleric_holder(H, H.patron)
	C.grant_spells_churchling(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)

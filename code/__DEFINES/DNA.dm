/*ALL DNA, SPECIES, AND GENETICS-RELATED DEFINES GO HERE*/

#define CHECK_DNA_AND_SPECIES(C) if((!(C.dna)) || (!(C.dna.species))) return

#define UI_CHANGED "ui changed"
#define UE_CHANGED "ue changed"

#define CHAMELEON_MUTATION_DEFAULT_TRANSPARENCY 204

// String identifiers for associative list lookup

//Types of usual mutations
#define	POSITIVE 			1
#define	NEGATIVE			2
#define	MINOR_NEGATIVE		4


//Mutation classes. Normal being on them, extra being additional mutations with instability and other being stuff you dont want people to fuck with like wizard mutate
#define MUT_NORMAL 1
#define MUT_EXTRA 2
#define MUT_OTHER 3

//DNA - Because fuck you and your magic numbers being all over the codebase.
#define DNA_BLOCK_SIZE				3

#define DNA_UNI_IDENTITY_BLOCKS		7
#define DNA_HAIR_COLOR_BLOCK		1
#define DNA_FACIAL_HAIR_COLOR_BLOCK	2
#define DNA_SKIN_TONE_BLOCK			3
#define DNA_EYE_COLOR_BLOCK			4
#define DNA_GENDER_BLOCK			5

#define DNA_SEQUENCE_LENGTH			4
#define DNA_MUTATION_BLOCKS			6
#define DNA_UNIQUE_ENZYMES_LEN		32

//Transformation proc stuff
#define TR_KEEPITEMS	(1<<0)
#define TR_KEEPVIRUS	(1<<1)
#define TR_KEEPDAMAGE	(1<<2)
/// hashing names (e.g. monkey(e34f)) (only in monkeyize)
#define TR_HASHNAME		(1<<3)
#define TR_KEEPIMPLANTS	(1<<4)
/// changelings shouldn't edit the DNA's SE when turning into a monkey
#define TR_KEEPSE		(1<<5)
#define TR_DEFAULTMSG	(1<<6)
#define TR_KEEPORGANS	(1<<8)
#define TR_KEEPSTUNS	(1<<9)
#define TR_KEEPREAGENTS	(1<<10)
#define TR_KEEPAI 		(1<<11)

#define CLONER_FRESH_CLONE "fresh"
#define CLONER_MATURE_CLONE "mature"

//species traits for mutantraces
#define MUTCOLORS		1
//#define HAIR			2 //This is redefined in a bitflag in inventory.dm
#define FACEHAIR		3
#define EYECOLOR		4
#define LIPS			5
#define NOBLOOD			6
#define NOTRANSSTING	7
/// Used if we want the mutant colour to be only used by mutant bodyparts. Don't combine this with MUTCOLORS, or it will be useless.
#define MUTCOLORS_PARTSONLY	8
#define NOZOMBIE		9
/// Uses weird leg sprites. Optional for Lizards, required for ashwalkers. Don't give it to other races unless you make sprites for this (see human_parts_greyscale.dmi)
#define DIGITIGRADE		10
#define NO_UNDERWEAR	11
#define NOSTOMACH		12
#define NO_DNA_COPY     13
#define DRINKSBLOOD		14
/// Use this if you want to change the race's color without the player being able to pick their own color. AKA special color shifting
#define DYNCOLORS		15
#define AGENDER			16
/// Do not draw eyes or eyeless overlay
#define NOEYESPRITES	17
#define SKINCOLOR		18
#define YOUNGBEARD		19 //dwarves only
#define STUBBLE			20
#define OLDGREY			21
#define NO_ORGAN_FEATURES			22
#define NO_BODYPART_FEATURES			23

//organ defines
#define STANDARD_ORGAN_THRESHOLD 	100
#define STANDARD_ORGAN_HEALING 		0.001
/// designed to fail organs when left to decay for ~15 minutes
#define STANDARD_ORGAN_DECAY		0.00222

//used for the can_chromosome var on mutations
#define CHROMOSOME_NEVER 0
#define CHROMOSOME_NONE 1
#define CHROMOSOME_USED 2

#define G_MALE 1
#define G_FEMALE 2
#define G_PLURAL 3

#define MANDATORY_FEATURE_LIST list()

#define HAIR_COLOR_LIST list("#8f5a00", "#593800", "#362200", "#4e422e", "#8c8271", "#bfb7ab", "#31302e", "#f0dc48")
#define EYE_COLOR_LIST list("#865900", "#06b400", "#312f27", "#008e83", "#002d8e", "#c16c00")

#define DEFAULT_PENIS_SIZE 2
#define MIN_PENIS_SIZE 1
#define MAX_PENIS_SIZE 3 //5 available, above 3 are HYPER.
#define TOTAL_PENIS_SIZE 5

#define PENIS_TYPE_PLAIN 1
#define PENIS_TYPE_KNOTTED 2
#define PENIS_TYPE_EQUINE 3
#define PENIS_TYPE_TAPERED 4
#define PENIS_TYPE_TAPERED_DOUBLE 5
#define PENIS_TYPE_TAPERED_DOUBLE_KNOTTED 6
#define PENIS_TYPE_BARBED 7
#define PENIS_TYPE_BARBED_KNOTTED 8
#define PENIS_TYPE_TENTACLE 9

#define SHEATH_TYPE_NONE 0
#define SHEATH_TYPE_NORMAL 1
#define SHEATH_TYPE_SLIT 2

#define ERECT_STATE_NONE 0
#define ERECT_STATE_PARTIAL 1
#define ERECT_STATE_HARD 2

#define DEFAULT_TESTICLES_SIZE 3
#define MIN_TESTICLES_SIZE 1
#define MAX_TESTICLES_SIZE 3 //5 available, above 3 are hyper and are not selectable but used for potion effect.
#define TOTAL_TESTICLES_SIZE 5

#define DEFAULT_BELLY_SIZE 0
#define MIN_BELLY_SIZE 0
#define MAX_BELLY_SIZE 3

#define DEFAULT_BREASTS_SIZE 3
#define MIN_BREASTS_SIZE 0
#define MAX_BREASTS_SIZE 13 //16 available, above 13 is hyper-er.
#define TOTAL_BREASTS_SIZE 16

#define DEFAULT_BUTT_SIZE 0
#define MIN_BUTT_SIZE 0
#define MAX_BUTT_SIZE 4 //5 available, above 4 may be too big.
#define TOTAL_BUTT_SIZE 5

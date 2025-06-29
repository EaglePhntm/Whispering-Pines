/datum/round_event_control/zizo_defilement
	name = "Tenebrase's Defilement"
	track = EVENT_TRACK_INTERVENTION
	typepath = /datum/round_event/zizo_defilement
	weight = 8
	earliest_start = 25 MINUTES
	max_occurrences = 2
	min_players = 40
	allowed_storytellers = list(/datum/storyteller/tenebrase)

/datum/round_event/zizo_defilement/start()
	SSmapping.add_world_trait(/datum/world_trait/zizo_defilement, 15 MINUTES)

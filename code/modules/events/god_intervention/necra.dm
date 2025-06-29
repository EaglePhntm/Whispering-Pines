/datum/round_event_control/last_death_requiem
	name = "Last Death's Requiem"
	track = EVENT_TRACK_INTERVENTION
	typepath = /datum/round_event/last_death_requiem
	weight = 8
	earliest_start = 15 MINUTES
	max_occurrences = 2
	min_players = 20
	allowed_storytellers = list(/datum/storyteller/last_death)

/datum/round_event/last_death_requiem/start()
	SSmapping.add_world_trait(/datum/world_trait/last_death_requiem, 15 MINUTES)

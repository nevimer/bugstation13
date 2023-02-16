// Prevents valentines antagonist from being assigned to anyone
/datum/antagonist/valentine/can_be_owned(datum/mind/new_owner)
	return FALSE

// Disable the event
/datum/round_event_control/valentines
	weight = 0
	max_occurrences = 0

/datum/round_event_control/valentines/can_spawn_event(players_amt)
	. = ..()
	return FALSE

// Don't do anything if we somehow run this event
/datum/round_event/valentines/start()
	return

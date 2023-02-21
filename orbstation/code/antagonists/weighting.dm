/// The number of rounds at which we stop counting
#define MAX_WEIGHTED_ROUND_COUNT 8
/// Increase weight by one every X rounds
#define ROUNDS_PER_WEIGHT 2

// System changes to spread antagonist weight out somewhat between rounds
/datum/controller/subsystem/persistence
	/// Associative list of ckey to how likely they should be to get an antagonist role
	var/list/rounds_since_ckey_was_antagonist = list()
	/// List of ckeys who were given weighted antagonist roles in this round
	var/list/current_round_weighted_antagonists = list()

/datum/controller/subsystem/persistence/Initialize()
	. = ..()
	load_antag_weights()

/datum/controller/subsystem/persistence/collect_data()
	. = ..()
	update_antag_weights()

#define ANTAG_WEIGHTS_PATH "data/antag_weighting.json"

/// Load our saved list of ckeys to "time since they were an antagonist" from a file
/datum/controller/subsystem/persistence/proc/load_antag_weights()
	var/file = file(ANTAG_WEIGHTS_PATH)
	if(!fexists(file))
		return
	var/weight_json = file2text(file)
	rounds_since_ckey_was_antagonist = json_decode(weight_json)

/// Save a new round end count of ckeys to "time since they were an antagonist" to a file
/datum/controller/subsystem/persistence/proc/update_antag_weights()
	var/file = file(ANTAG_WEIGHTS_PATH)
	fdel(file)

	var/list/new_rounds_since_antagonist_count = list()
	for (var/ckey in GLOB.joined_player_list)
		if (ckey in SSpersistence.current_round_weighted_antagonists)
			new_rounds_since_antagonist_count[ckey] = 1
			continue
		if (ckey in rounds_since_ckey_was_antagonist)
			new_rounds_since_antagonist_count[ckey] = min(8, rounds_since_ckey_was_antagonist[ckey] + 1)
			continue
		new_rounds_since_antagonist_count[ckey] = 2 // They just finished their first one

	for (var/ckey in rounds_since_ckey_was_antagonist) // Don't forget people who weren't here
		if (ckey in new_rounds_since_antagonist_count)
			continue
		new_rounds_since_antagonist_count[ckey] = rounds_since_ckey_was_antagonist[ckey]

	WRITE_FILE(file, json_encode(new_rounds_since_antagonist_count))

#undef ANTAG_WEIGHTS_PATH

/// Takes a list of candidates, returns a weighted list of candidates.
/datum/dynamic_ruleset/proc/generate_weighted_candidate_list()
	var/list/weighted_candidates = list()
	for (var/mob/candidate as anything in candidates)
		var/key = candidate.ckey
		if (!(key in SSpersistence.rounds_since_ckey_was_antagonist))
			weighted_candidates[candidate] = 1
			continue
		var/rounds_since_last = SSpersistence.rounds_since_ckey_was_antagonist[key]
		weighted_candidates[candidate] = ROUND_UP(rounds_since_last / ROUNDS_PER_WEIGHT) // Increase weight by 1 every 2 rounds
	return weighted_candidates

#define TIME_UNTIL_SURE 25 MINUTES

// Mark some antagonists as being things we care about for weight calculation
/datum/antagonist
	/// If true then having this datum assigned will reset your weight at the end of a round
	var/weighted_antagonist = FALSE

/datum/antagonist/on_gain()
	. = ..()
	if(!owner || !owner.current || !weighted_antagonist)
		return
	addtimer(CALLBACK(src, PROC_REF(record_antagonist_ckey)), TIME_UNTIL_SURE, TIMER_DELETE_ME)

/// Adds someone to our list of "people who need their rounds since they were evil" count reset
/datum/antagonist/proc/record_antagonist_ckey()
	if(!owner || !owner.current)
		return
	SSpersistence.current_round_weighted_antagonists |= owner.current.ckey

#undef TIME_UNTIL_SURE

/datum/antagonist/traitor
	weighted_antagonist = TRUE

/datum/antagonist/brother
	weighted_antagonist = TRUE

/datum/antagonist/changeling
	weighted_antagonist = TRUE

/datum/antagonist/changeling/infiltrator
	weighted_antagonist = FALSE // We don't count ghost roles

/datum/antagonist/heretic
	weighted_antagonist = TRUE

/datum/antagonist/malf_ai
	weighted_antagonist = TRUE

/datum/antagonist/blob/infection
	weighted_antagonist = TRUE // lol just for consistency

/datum/antagonist/rev
	weighted_antagonist = TRUE

/datum/antagonist/cult
	weighted_antagonist = TRUE

#undef MAX_WEIGHTED_ROUND_COUNT
#undef ROUNDS_PER_WEIGHT

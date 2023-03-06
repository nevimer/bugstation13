/**
 * Adds a higher chance to fish up dead players than anything else.
 */
/obj/effect/abstract/chasm_storage
	/// List of mobs controlled by players who have fallen in here
	var/list/player_mobs = list()

/// Don't get boiled by ash while down there
/obj/effect/abstract/chasm_storage/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_WEATHER_IMMUNE, ROUNDSTART_TRAIT)

/// Add fallen mobs with ckeys to a high priority list
/obj/effect/abstract/chasm_storage/Entered(atom/movable/arrived, atom/old_loc, list/atom/old_locs)
	. = ..()
	if (!ismob(arrived))
		return
	var/mob/fallen_mob = arrived
	if (!fallen_mob.ckey)
		return
	if (fallen_mob in player_mobs)
		return
	player_mobs += fallen_mob

/obj/effect/abstract/chasm_storage/Exited(atom/movable/gone, direction)
	. = ..()
	player_mobs -= gone

// You can't attack this but monsters which fall in will try anyway
/obj/effect/abstract/chasm_storage/attack_generic(mob/user, damage_amount, damage_type, damage_flag, sound_effect, armor_penetration)
	return FALSE

/// 40% of the time fish up a player corpse if one exists
/obj/item/chasm_detritus/Initialize(mapload)
	if (prob(40) && retrieve_player_body())
		return INITIALIZE_HINT_QDEL
	return ..()

/// Retrieves a corpse if there is one
/obj/item/chasm_detritus/proc/retrieve_player_body()
	if (!GLOB.chasm_storage.len)
		return FALSE

	var/list/chasm_contents = list()
	var/list/chasm_storage_resolved = recursive_list_resolve(GLOB.chasm_storage)
	for (var/obj/effect/abstract/chasm_storage/storage as anything in chasm_storage_resolved)
		for (var/thing as anything in storage.player_mobs)
			chasm_contents += thing

	if (!length(chasm_contents))
		return FALSE

	var/atom/movable/body = pick(chasm_contents)
	body.forceMove(get_turf(src))
	return TRUE

// Orb override to climb calmly out of a chasm instead of hurling yourself in a random direction
/datum/component/chasm/on_revive(mob/living/escapee)
	var/atom/chasm = parent
	var/turf/escape_turf = get_nearest_safe_turf(chasm)
	if (!escape_turf)
		return ..() // Fall back to flinging

	chasm.visible_message(span_boldwarning("After a long climb, [escapee] emerges from [chasm]!"))
	escapee.forceMove(escape_turf)
	escapee.Paralyze(5 SECONDS, TRUE)
	UnregisterSignal(escapee, COMSIG_LIVING_REVIVE)

/datum/component/chasm/proc/get_nearest_safe_turf(atom/chasm)
	var/list/nearby_open_turfs = list()
	for (var/turf/open/sanctuary in orange(3, chasm))
		if (sanctuary.is_blocked_turf(exclude_mobs = FALSE) || ischasm(sanctuary) || islava(sanctuary))
			continue
		nearby_open_turfs += sanctuary

	if (!length(nearby_open_turfs))
		return null
	return get_closest_atom(/turf/, nearby_open_turfs, chasm)

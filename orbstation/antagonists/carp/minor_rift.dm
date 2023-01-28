#define RIFT_CHARGE_TIME 15 MINUTES
#define CHARGE_COMPLETED 2

/**
 * This carp rift doesn't have the charging behaviour and has less armour, any weapon should damage it.
 * Conversely because there's fewer ghosts it also summons a handful of NPC carp.
 */
/obj/structure/carp_rift/minor
	armor_type = /datum/armor/none
	max_charge = INFINITY
	/// Create an NPC carp this often
	var/npc_carp_interval = 30 SECONDS
	/// Team to assign new carps to
	var/datum/team/carp_team/team = new()
	/// What time was it when we were created
	var/spawn_time
	/// Where are all our little guys headed
	var/list/migration_path = list()

/obj/structure/carp_rift/minor/Initialize(mapload)
	. = ..()
	addtimer(CALLBACK(src, .proc/make_carp), npc_carp_interval, TIMER_DELETE_ME)
	addtimer(CALLBACK(src, .proc/fully_charge), RIFT_CHARGE_TIME, TIMER_DELETE_ME)
	spawn_time = world.time

/obj/structure/carp_rift/minor/show_charge_level()
	if (charge_state == CHARGE_COMPLETED)
		return span_warning("This one is fully charged. In this state, it is poised to transport a much larger amount of carp than normal.")

	var/percent_charged = (world.time - spawn_time) / (RIFT_CHARGE_TIME)
	return span_notice("It seems to be [round(percent_charged * 100)]% charged.")

/obj/structure/carp_rift/minor/on_spawned(mob/living/newcarp)
	newcarp.mind.add_antag_datum(/datum/antagonist/rift_carp, team)

/// Creates a new fish and sets it off towards the space station
/obj/structure/carp_rift/minor/proc/make_carp()
	if (!length(migration_path))
		migration_path = find_migration_path()
	var/mob/living/basic/carp/new_fish = new(loc)
	new_fish.migrate_to(migration_path)
	addtimer(CALLBACK(src, .proc/make_carp), npc_carp_interval, TIMER_DELETE_ME)

/// Decide how the fish are going to wander through the station
/obj/structure/carp_rift/minor/proc/find_migration_path()
	var/list/valid_areas = list()
	var/list/station_areas = GLOB.the_station_areas
	for (var/area/potential_area as anything in SSmapping.areas_in_z["[z]"])
		if (!is_type_in_list(potential_area, station_areas))
			continue
		valid_areas += potential_area

	var/turf/station_turf = get_safe_random_station_turf(valid_areas)
	if (!station_turf)
		return list()
	var/turf/exit_turf = get_edge_target_turf(station_turf, pick(GLOB.alldirs))
	return list(WEAKREF(station_turf), WEAKREF(exit_turf))

/// Called after 10 minutes of existing, the rift spawns ghosts twice as fast
/obj/structure/carp_rift/minor/proc/fully_charge()
	charge_state = CHARGE_COMPLETED
	var/area/A = get_area(src)
	priority_announce("Spatial object has reached peak energy charge in [initial(A.name)], please stand-by.", "Central Command Wildlife Observations")
	icon_state = "carp_rift_charged"
	set_light_color(LIGHT_COLOR_YELLOW)
	update_light()
	carp_interval = 30 // No SECONDS define, this is incremented by delta time
	npc_carp_interval = 10 SECONDS
	team.succeed()

#undef RIFT_CHARGE_TIME
#undef CHARGE_COMPLETED

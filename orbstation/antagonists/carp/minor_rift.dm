#define RIFT_CHARGE_TIME 10 MINUTES
#define CHARGE_COMPLETED 2

/**
 * This carp rift doesn't have the charging behaviour and has less armour, any weapon should damage it.
 * Conversely because there's fewer ghosts it also summons a handful of NPC carp.
 */
/obj/structure/carp_rift/minor
	armor_type = /datum/armor/none
	max_charge = INFINITY
	/// Create an NPC carp this often
	var/npc_carp_interval = 40 SECONDS
	/// Team to assign new carps to
	var/datum/team/carp_team/team
	/// What time was it when we were created
	var/spawn_time
	/// Where are all our little guys headed
	var/list/migration_path = list()

/obj/structure/carp_rift/minor/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/gps, "Anomalous Organic Signal")
	team = new(starting_members = list(), z_level = z)
	make_carp()
	addtimer(CALLBACK(src, .proc/fully_charge), RIFT_CHARGE_TIME, TIMER_DELETE_ME)
	spawn_time = world.time

/obj/structure/carp_rift/minor/show_charge_level()
	if (charge_state == CHARGE_COMPLETED)
		return span_warning("This one is fully charged. It should have deleted itself by now, what the hell?")

	var/percent_charged = (world.time - spawn_time) / (RIFT_CHARGE_TIME)
	return span_notice("It seems to be [round(percent_charged * 100)]% charged.")

/obj/structure/carp_rift/minor/on_spawned(mob/living/newcarp)
	newcarp.mind.add_antag_datum(/datum/antagonist/rift_carp, team)

/obj/structure/carp_rift/minor/Destroy()
	. = ..()
	QDEL_NULL(migration_path)

/// Creates a new fish and sets it off towards the space station
/obj/structure/carp_rift/minor/proc/make_carp()
	if (!length(migration_path))
		migration_path = find_migration_path()
	var/mob/living/basic/carp/new_fish = new(loc)
	new_fish.migrate_to(migration_path)
	addtimer(CALLBACK(src, .proc/make_carp), npc_carp_interval, TIMER_DELETE_ME)

/// Decide how the fish are going to wander through the station
/obj/structure/carp_rift/minor/proc/find_migration_path()
	if (!team)
		return list()
	return list(team.destination, team.exit)

/// Called after 10 minutes of existing, the rift spawns ghosts twice as fast
/obj/structure/carp_rift/minor/proc/fully_charge()
	priority_announce("Spatial object has reached peak energy charge, please stand-by.", "Central Command Wildlife Observations")
	team.succeed()
	var/datum/round_event_control/summon_carp = locate(/datum/round_event_control/carp_migration) in SSevents.control
	if (summon_carp)
		summon_carp.runEvent()
	playsound(get_turf(src), 'sound/magic/charge.ogg', 100, TRUE)
	qdel(src)

#undef RIFT_CHARGE_TIME
#undef CHARGE_COMPLETED

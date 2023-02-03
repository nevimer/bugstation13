/// A carp spawned from a minor carp rift, tasked to make sure it is not destroyed
/datum/antagonist/rift_carp
	name = "\improper Space Carp"
	roundend_category = "space dragons"
	antagpanel_category = ANTAG_GROUP_LEVIATHANS
	job_rank = ROLE_SENTIENCE
	show_name_in_check_antagonists = TRUE
	show_in_antagpanel = FALSE
	ui_name = "AntagInfoRiftCarp"
	/// Team of carp from the same rift
	var/datum/team/carp_team/team
	/// Where we headed boys?
	var/destination

/datum/antagonist/rift_carp/create_team(datum/team/carp_team/new_team)
	if(!new_team)
		return
	if(!istype(new_team))
		stack_trace("Wrong team type passed to [type] initialization.")
	team = new_team

/datum/antagonist/rift_carp/get_team()
	return team

/datum/antagonist/rift_carp/on_gain()
	objectives += team.objectives
	destination = get_area_name(team.destination.resolve())
	return ..()

/datum/antagonist/rift_carp/ui_static_data(mob/user)
	var/list/data = list()
	data["destination"] = destination
	return data

/datum/antagonist/rift_carp/greet()
	. = ..()
	owner.announce_objectives()

/// Display all the carp at once in the round end
/datum/team/carp_team
	member_name = "\improper Space Carp"
	/// Did we win?
	var/succeeded = FALSE
	/// Where are we going?
	var/datum/weakref/destination
	/// Where are we going after that?
	var/datum/weakref/exit

/datum/team/carp_team/New(starting_members, z_level)
	..()
	name = "Carp Rift [pick(GLOB.greek_letters)]"
	find_migration_path(z_level)
	var/datum/objective/custom/custom_objective = new()
	custom_objective.team = src
	custom_objective.name = "Protect the Carp Rift"
	custom_objective.explanation_text = "Protect the rift you emerged from until it is fully charged. The Carp stream must flow!"
	objectives += custom_objective

/// Decide how the fish are going to wander through the station
/datum/team/carp_team/proc/find_migration_path(z_level)
	var/list/valid_areas = list()
	var/list/station_areas = GLOB.the_station_areas
	for (var/area/potential_area as anything in SSmapping.areas_in_z["[z_level]"])
		if (!is_type_in_list(potential_area, station_areas))
			continue
		valid_areas += potential_area

	if (!length(valid_areas))
		return // For when this is run during unit tests
	var/turf/station_turf = get_safe_random_station_turf(valid_areas)
	destination = WEAKREF(station_turf)
	var/turf/exit_turf = get_edge_target_turf(station_turf, pick(GLOB.alldirs))
	exit = WEAKREF(exit_turf)

/// Called when rift is fully charged
/datum/team/carp_team/proc/succeed()
	succeeded = TRUE
	for (var/datum/mind/member as anything in members)
		to_chat(member, span_greentext("The rift was defended until it closed! Good job!"))

/datum/team/carp_team/roundend_report()
	var/list/result = list()

	result += "<span class='header'>[name] [(succeeded) ? "closed by itself" : "was closed before it expired"].<br></span>"
	result += "<span class='big'>The defenders of [name] were:<br></span>"
	for(var/datum/mind/carp_mind in members)
		result += printplayer(carp_mind)

	return "<div class='panel redborder'>[result.Join("<br>")]</div>"

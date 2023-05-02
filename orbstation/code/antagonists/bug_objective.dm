// A currently unused re-implementation of traitor's old "bug room" objective, now focused on bugging a random room related to the target.
// Not finished.

/// Bug room objective - modification of the old traitor objective, but targeting a room important to your target instead of a head's office.
/datum/objective/bug_room
	name = "bug room"
	var/area/bug_area

/datum/objective/bug_room/proc/set_target(datum/mind/bug_target)
	target = bug_target

	//generate destination
	var/list/available_rooms = GLOB.jobs_to_rooms[target.assigned_role.title]
	var/list/possible_areas = list()
	for(var/area/possible_area as anything in available_rooms)
		if(is_path_in_list(possible_area, GLOB.the_station_areas))
			possible_areas += possible_area
			possible_areas[possible_area] = available_rooms[possible_area]
	bug_area = pick_weight(possible_areas)

	if(!bug_area) //no rooms found, somehow
		return

	//Grant the action that summons the bug
	var/datum/action/give_room_bug/bug_action = new(owner.current)
	bug_action.target_area = bug_area

	update_explanation_text()

/datum/objective/bug_room/update_explanation_text()
	..()
	if(target?.current && bug_area)
		explanation_text = "Plant your provided bug in [bug_area.name] to spy on [target.name]."
	else
		explanation_text = "Free Objective"

/datum/action/give_room_bug
	name = "Summon Bug"
	desc = "Calls your bug into your hand. Make sure you're ready to use it, as it's a very suspicious item."
	check_flags = AB_CHECK_CONSCIOUS | AB_CHECK_INCAPACITATED | AB_CHECK_HANDS_BLOCKED
	button_icon = 'icons/obj/device_syndie.dmi'
	button_icon_state = "bug"
	//The area where the bug should be used
	var/area/target_area

/datum/action/give_room_bug/Trigger(trigger_flags)
	. = ..()
	var/obj/item/traitor_bug/room_bug/new_bug = new
	new_bug.target_area_type = target_area
	owner.put_in_hands(new_bug)
	qdel(src)

/// Item for the bug objective. Code re-added from the old traitor "bug room" objective.
/obj/item/traitor_bug/room_bug
	/// The area at which this bug can be planted at. Has to be a type.
	var/area/target_area_type

/obj/item/traitor_bug/room_bug/examine(mob/user)
	. = ..()
	if(user.mind?.has_antag_datum(/datum/antagonist/contract_killer))
		if(target_area_type)
			. += span_notice("This device must be placed by <b>using it in hand</b> inside the <b>[initial(target_area_type.name)]</b>.")
		. += span_notice("Remember, you may leave behind fingerprints or fibers on the device. Use <b>soap</b> or similar to scrub it clean to be safe!")

/obj/item/traitor_bug/room_bug/interact(mob/user)
	. = ..()
	if(!target_area_type)
		return
	var/turf/location = drop_location()
	if(!location)
		return
	var/area/current_area = get_area(location)
	if(!istype(current_area, target_area_type))
		balloon_alert(user, "you can't deploy this here!")
		return
	if(!do_after(user, deploy_time, src))
		return
	var/obj/structure/room_bug/new_bug = new(location)
	transfer_fingerprints_to(new_bug)
	transfer_fibers_to(new_bug)
	qdel(src)

/obj/structure/room_bug
	name = "suspicious device"
	desc = "It looks dangerous. Best you leave this alone."

	anchored = TRUE

	icon = 'icons/obj/device_syndie.dmi'
	icon_state = "bug-animated"

/obj/structure/room_bug/Initialize(mapload)
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(fade_out), 10 SECONDS), 3 MINUTES)

/obj/structure/room_bug/proc/fade_out(seconds)
	animate(src, alpha = 30, time = seconds)

/obj/structure/room_bug/deconstruct(disassembled)
	explosion(src, light_impact_range = 2, flame_range = 5, explosion_cause = src)
	return ..()

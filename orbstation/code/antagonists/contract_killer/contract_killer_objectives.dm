// Contract Killer unique objectives. Some of these are modified from or based on Obsessed objectives.

/// Spend time close to your target to gather intel. Copied partly from the "spend time" objective from Obsessed.
/datum/objective/gather_intel
	name = "gather_intel"
	var/timer = 8 MINUTES
	var/viewing = FALSE //whether the killer is viewing their target

/datum/objective/gather_intel/proc/start_ticking()
	if(!owner.current)
		return
	RegisterSignal(owner.current, COMSIG_LIVING_LIFE, PROC_REF(on_life))

/datum/objective/gather_intel/proc/stop_ticking()
	if(!owner.current)
		return
	UnregisterSignal(owner.current, COMSIG_LIVING_LIFE)

/datum/objective/gather_intel/update_explanation_text()
	if(target?.current)
		explanation_text = "Gather intel by spending at least [DisplayTimeText(timer)] around [target.name] while they're alive."
	else
		explanation_text = "Free Objective"

/datum/objective/gather_intel/check_completion()
	return timer <= 0 || explanation_text == "Free Objective"

/// Every tick, checks if the killer's target is within 7 tiles. Counts down their timer and gives them a mood buff if so.
/datum/objective/gather_intel/proc/on_life(mob/living/source, seconds_per_tick, times_fired)
	SIGNAL_HANDLER

	if(!target || target.current.stat == DEAD)
		viewing = FALSE //we don't want to give a mood boost or progress for standing near a corpse
		return
	if(get_dist(get_turf(owner.current), get_turf(target.current)) > 7)
		viewing = FALSE //they are further than our view range they are not viewing us
		return //so we're not searching everything in view every tick
	if(target.current in view(7, owner.current))
		viewing = TRUE
	else
		viewing = FALSE
	if(viewing)
		timer -= seconds_per_tick SECONDS //mob subsystem ticks every 2 seconds(?), remove 20 deciseconds from the timer. sure, that makes sense.
		if(timer <= 0) //give a ten-minute mood buff, announce to chat, and stop ticking
			owner.current.add_mood_event("studied", /datum/mood_event/studied_target, target.current.name)
			to_chat(owner.current, span_boldbig("You have finished studying [target.current.name]. Complete your other preparations and kill them!"))
			stop_ticking()
			return
		owner.current.add_mood_event("studying", /datum/mood_event/studying_target, target.current.name)

/// Mood given every tick while within 7 tiles of your target.
/datum/mood_event/studying_target
	description = "Your days are numbered..."
	mood_change = 6
	timeout = 3 SECONDS
	hidden = TRUE

/datum/mood_event/studying_target/add_effects(name)
	description = "Your days are numbered, [name]..."

/// Powerful mood only given once, when the target has been fully studied.
/datum/mood_event/studied_target
	description = "I have finished studying my target. Soon I'll make the kill..."
	mood_change = 8
	timeout = 10 MINUTES
	hidden = TRUE

/datum/mood_event/studying_target/add_effects(name)
	description = "Your days are numbered, [name]..."

/// Cut power objective - find a way to cut power to the target's workplace.
/datum/objective/cut_power
	name = "cut power"

/datum/objective/cut_power/update_explanation_text()
	..()
	if(target?.current)
		explanation_text = "Cut off power to [target.name]'s workplace."
	else
		explanation_text = "Free Objective"

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
	var/datum/action/give_killer_bug/bug_action = new(owner.current)
	bug_action.target_area = bug_area

	update_explanation_text()

/datum/objective/bug_room/update_explanation_text()
	..()
	if(target?.current && bug_area)
		explanation_text = "Plant your provided bug in [bug_area.name] to spy on [target.name]."
	else
		explanation_text = "Free Objective"

/datum/action/give_killer_bug
	name = "Summon Bug"
	desc = "Calls your bug into your hand. Make sure you're ready to use it, as it's a very suspicious item."
	check_flags = AB_CHECK_CONSCIOUS | AB_CHECK_INCAPACITATED | AB_CHECK_HANDS_BLOCKED
	button_icon = 'icons/obj/device_syndie.dmi'
	button_icon_state = "bug"
	//The area where the bug should be used
	var/area/target_area

/datum/action/give_killer_bug/Trigger(trigger_flags)
	. = ..()
	var/obj/item/traitor_bug/contract_killer/new_bug = new
	new_bug.target_area_type = target_area
	owner.put_in_hands(new_bug)
	qdel(src)

/// "Default" RP objective, telling you to do this cleanly.
/datum/objective/clean_kill
	name = "clean kill"
	explanation_text = "Do not get caught. Avoid collateral damage."

/// RP objective, tasking you to frame a random person on the station for your murder. Likely to get silly when you try to frame the captain.
/datum/objective/frame_job
	name = "frame job"

/datum/objective/frame_job/update_explanation_text()
	..()
	if(target?.current)
		explanation_text = "Frame [target.name] for your kill."
	else
		explanation_text = "Do not get caught. Avoid collateral damage." //just do the default if this one isn't available

/// RP objective asking you to make the murder look like an accident. Very up for interpretation by design.
/datum/objective/accident_kill
	name = "accident kill"
	explanation_text = "Make the murder look like an accident."

/// Item for the bug objective. Code re-added from the old traitor "bug room" objective.
/obj/item/traitor_bug/contract_killer
	/// The area at which this bug can be planted at. Has to be a type.
	var/area/target_area_type

/obj/item/traitor_bug/contract_killer/examine(mob/user)
	. = ..()
	if(user.mind?.has_antag_datum(/datum/antagonist/contract_killer))
		if(target_area_type)
			. += span_notice("This device must be placed by <b>using it in hand</b> inside the <b>[initial(target_area_type.name)]</b>.")
		. += span_notice("Remember, you may leave behind fingerprints or fibers on the device. Use <b>soap</b> or similar to scrub it clean to be safe!")

/obj/item/traitor_bug/contract_killer/interact(mob/user)
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
	var/obj/structure/contract_killer_bug/new_bug = new(location)
	transfer_fingerprints_to(new_bug)
	transfer_fibers_to(new_bug)
	qdel(src)

/obj/structure/contract_killer_bug
	name = "suspicious device"
	desc = "It looks dangerous. Best you leave this alone."

	anchored = TRUE

	icon = 'icons/obj/device_syndie.dmi'
	icon_state = "bug-animated"

/obj/structure/contract_killer_bug/Initialize(mapload)
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(fade_out), 10 SECONDS), 3 MINUTES)

/obj/structure/contract_killer_bug/proc/fade_out(seconds)
	animate(src, alpha = 30, time = seconds)

/obj/structure/contract_killer_bug/deconstruct(disassembled)
	explosion(src, light_impact_range = 2, flame_range = 5, explosion_cause = src)
	return ..()

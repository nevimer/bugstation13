// Contract Killer unique objectives. Some of these are modified from or based on Obsessed objectives.

/// Spend time close to your target to gather intel. Copied partly from the "spend time" objective from Obsessed.
/datum/objective/gather_intel
	name = "gather_intel"
	var/timer = 5 MINUTES
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
		explanation_text = "Gather intel by spending at least [DisplayTimeText(timer)] around [target.name] while they're alive. Once complete, \
			you will be able to choose a kit of special assassination gear."
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
		if(timer <= 0) //give a ten-minute mood buff, announce to chat, give access to gear, and stop ticking
			owner.current.add_mood_event("studied", /datum/mood_event/studied_target, target.current.name)
			to_chat(owner.current, span_boldbig("You have finished studying [target.current.name]. You may now acquire your assassination gear."))
			var/datum/action/get_killer_gear/gear_action = new(owner.current)
			gear_action.Grant(owner.current)
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

/// "Fluff" objectives for what to do during/after the kill
/datum/objective/contract_killer
	name = "contract killer instructions"
	/// How likely this is to be chosen for the fluff objective.
	var/weight = CONTRACT_KILLER_OBJ_ABSTRACT

/// Make the murder look like an accident
/datum/objective/contract_killer/accident
	name = "accident kill"
	explanation_text = "Make it look like an accident."
	weight = CONTRACT_KILLER_OBJ_UNCOMMON

/// Fluff objective to try to fake out the autopsy results. Only appears if a coroner is present.
/datum/objective/contract_killer/hide_cause
	name = "hide cause of death"
	explanation_text = "Hide the cause of death so that it can't be discerned from an autopsy. Ensure the body is not destroyed \
		in the process."
	weight = CONTRACT_KILLER_OBJ_UNCOMMON

/// "Targeted" objectives involve another person on the station
/datum/objective/contract_killer/targeted
	name = "targeted objective"
	weight = CONTRACT_KILLER_OBJ_ABSTRACT

/datum/objective/contract_killer/targeted/frame
	name = "frame job"
	weight = CONTRACT_KILLER_OBJ_RARE

/datum/objective/contract_killer/targeted/frame/update_explanation_text()
	..()
	if(target?.current)
		explanation_text = "Frame [target.name] for your kill."
	else
		explanation_text = "Free Objective"

/datum/objective/contract_killer/targeted/find_remains
	name = "discover remains"
	weight = CONTRACT_KILLER_OBJ_COMMON

/datum/objective/contract_killer/targeted/find_remains/update_explanation_text()
	..()
	if(target?.current)
		explanation_text = "Leave the remains where [target.name] will find them. Whether this is the whole body or just part is up to you."
	else
		explanation_text = "Free Objective"

/datum/objective/contract_killer/location
	name = "leave in location"
	weight = CONTRACT_KILLER_OBJ_ABSTRACT
	/// The location where the body needs to be left
	var/area/target_location
	/// List of possible locations. Chosen from areas people are likely to go into sooner or later.
	var/static/list/whitelisted_areas = typecacheof(list(
		/area/station/hallway,
		/area/station/commons/lounge,
		/area/station/commons/storage,
		/area/station/maintenance/tram,
		/area/station/service/cafeteria,
		/area/station/service/kitchen/diner,
		/area/station/service/bar,
		/area/station/service/library,
		/area/station/service/chapel,
		/area/station/service/theater,
		/area/station/engineering/lobby,
		/area/station/medical/break_room,
		/area/station/security/detectives_office,
		/area/station/cargo/boutique,
		/area/station/cargo/sorting,
		/area/station/cargo/lobby,
		/area/station/science/lobby,
		/area/station/science/robotics/lab,
	))

/datum/objective/contract_killer/location/New()
	. = ..()
	find_location()

/datum/objective/contract_killer/location/proc/find_location()
	var/list/possible_areas = GLOB.the_station_areas.Copy()
	for(var/area/possible_area as anything in possible_areas)
		if(!is_type_in_typecache(possible_area, whitelisted_areas))
			possible_areas -= possible_area
	target_location = pick(possible_areas)

/// Leave the body somewhere
/datum/objective/contract_killer/location/body
	name = "leave body in location"
	weight = CONTRACT_KILLER_OBJ_COMMON

/datum/objective/contract_killer/location/body/update_explanation_text()
	..()
	if(target_location)
		explanation_text = "Leave the body in the [initial(target_location.name)]."
	else
		explanation_text = "Leave the body where it will be found." //if we somehow fail to find a location, give a more generic version

/datum/objective/contract_killer/location/head
	name = "leave head in location"
	weight = CONTRACT_KILLER_OBJ_RARE

/datum/objective/contract_killer/location/head/update_explanation_text()
	..()
	if(target_location)
		explanation_text = "Cut off the target's head and leave it in the [initial(target_location.name)]. Do what you want with the body."
	else
		explanation_text = "Cut off the target's head and leave it where it will be found. Do what you want with the body." //if we somehow fail to find a location, give a more generic version

/// Objective to take a photo of the body and upload it to a newscaster.
/datum/objective/contract_killer/newscaster
	name = "newscaster taunt"
	explanation_text = "Take a photo of the body and upload it anonymously to a newscaster. Summon and equip the provided ID card to keep it \
		anonymous! Do as you like with the body when you finish."
	weight = CONTRACT_KILLER_OBJ_COMMON

/datum/objective/contract_killer/proc/give_summon_action()
	if(owner?.current)
		var/datum/action/summon_anonymous_id/summon_action = new(owner.current)
		summon_action.Grant(owner.current)

/datum/action/summon_anonymous_id
	name = "Summon Anonymous ID"
	desc = "Calls an anonymous ID into your hand. Equip this in your ID slot to make a newscast anonymously."
	check_flags = AB_CHECK_CONSCIOUS | AB_CHECK_INCAPACITATED | AB_CHECK_HANDS_BLOCKED
	button_icon = 'icons/obj/card.dmi'
	button_icon_state = "card_grey"

/datum/action/summon_anonymous_id/Trigger(trigger_flags)
	. = ..()
	var/obj/item/card/id/advanced/anonymous/new_card = new
	owner.put_in_hands(new_card)
	qdel(src)

/// Special "anonymous" ID card for safe newscasting
/obj/item/card/id/advanced/anonymous
	registered_name = "ANONYMOUS"

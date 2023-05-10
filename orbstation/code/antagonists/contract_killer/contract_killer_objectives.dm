// Contract Killer unique objectives. Some of these are modified from or based on Obsessed objectives.

/// Spend time close to your target to gather intel. Copied partly from the "spend time" objective from Obsessed.
/datum/objective/gather_intel
	name = "gather_intel"
	//var/timer = 5 MINUTES
	var/timer = 5 SECONDS
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

/// RP objectives that require no specialized code
/datum/objective/contract_killer_rp
	name = "contract killer instructions"
	explanation_text = "Free Objective" //replaced in update_explanation_text()
	var/list/rp_objectives = list(
		"Make it look like an accident.",
		""
	)

/datum/objective/contract_killer_rp/update_explanation_text()


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

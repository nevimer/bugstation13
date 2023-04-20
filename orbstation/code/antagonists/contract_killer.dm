#define CK_OBJ_INTEL "gather_intel"
#define CK_OBJ_POLAROID "take_polaroid"
#define CK_OBJ_HEIRLOOM "steal_heirloom"
#define CK_OBJ_COVERUP "kill_coworker"

/// A re-imagining of the "Obsessed" antag, sharing some of its mechanics and goals but not the unpleasant flavor.
/datum/antagonist/contract_killer
	name = "Contract Killer"
	show_in_antagpanel = TRUE
	antagpanel_category = "Other"
	job_rank = ROLE_CONTRACT_KILLER
	antag_hud_name = "contractkiller"
	ui_name = "AntagInfoMinor"
	show_name_in_check_antagonists = TRUE
	roundend_category = "contract killers"
	count_against_dynamic_roll_chance = FALSE
	silent = FALSE
	suicide_cry = "FOR THE PAY!! Wait-"
	preview_outfit = /datum/outfit/contract_killer

/datum/antagonist/contract_killer/on_gain()
	forge_objectives()
	return ..()

/datum/antagonist/contract_killer/greet()
	owner.current.playsound_local(get_turf(owner.current), 'orbstation/sound/antag_alerts/contractkilleralert.ogg', 100, FALSE, pressure_affected = FALSE, use_reverb = FALSE)
	owner.announce_objectives()

/datum/antagonist/contract_killer/forge_objectives()
	var/list/objectives_left = list(CK_OBJ_INTEL, CK_OBJ_POLAROID)
	var/datum/objective/assassinate/kill_objective = new
	kill_objective.owner = owner
	var/datum/mind/target_mind = kill_objective.find_target()
	var/obj/family_heirloom

	//if the target has an heirloom, the contract killer might try to steal it
	var/datum/quirk/item_quirk/family_heirloom/heirloom_quirk = locate() in target_mind.current.quirks
	if(heirloom_quirk)
		family_heirloom = heirloom_quirk.heirloom?.resolve()
		if(family_heirloom)
			objectives_left += CK_OBJ_HEIRLOOM

	// If the target is not the captain, someone in the same department might also be a kill objective.
	if(!is_captain_job(target_mind.assigned_role))
		objectives_left += CK_OBJ_COVERUP

	for(var/i in 1 to 2)
		var/chosen_objective = pick_n_take(objectives_left)
		switch(chosen_objective)
			if(CK_OBJ_INTEL)
				var/datum/objective/gather_intel/intel = new
				intel.owner = owner
				intel.target = target_mind
				intel.start_ticking()
				objectives += intel
			if(CK_OBJ_POLAROID)
				var/datum/objective/polaroid/polaroid = new
				polaroid.owner = owner
				polaroid.target = target_mind
				objectives += polaroid
			if(CK_OBJ_HEIRLOOM)
				var/datum/objective/steal/heirloom_thief/heirloom_thief = new
				heirloom_thief.owner = owner
				heirloom_thief.target = target_mind //while you usually wouldn't need this for stealing, we need the name of the obsession
				heirloom_thief.steal_target = family_heirloom
				objectives += heirloom_thief
			if(CK_OBJ_COVERUP)
				var/datum/objective/assassinate/jealous/jealous = new
				jealous.owner = owner
				jealous.target = target_mind //will reroll into a coworker on the objective itself
				objectives += jealous

	objectives += kill_objective //Add the assassinate last, because you're meant to save it for last.

	//last objective
	var/obj_prob = rand(1,100)
	switch(obj_prob)
		if(1 to 70) //70% - "clean kill" objective
			var/datum/objective/clean_kill/clean = new
			clean.owner = owner
			objectives += clean
		if(71 to 85) //15% - "frame job" objective
			var/datum/objective/frame_job/frame = new
			frame.owner = owner
			frame.find_target(blacklist = list(target_mind))
			objectives += frame
		if(86 to 100) //15% - "accident kill" objective
			var/datum/objective/accident_kill/accident = new
			accident.owner = owner
			objectives += accident

	for(var/datum/objective/O in objectives)
		O.update_explanation_text()

//Objectives

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

/// Polaroid objective - keep a photo of your target alive, and your target dead, on your person.
/datum/objective/polaroid/update_explanation_text()
	..()
	if(target?.current)
		explanation_text = "Take a photo of [target.name] while they're alive, and another once they're dead. Keep both in your bag for delivery to your employer."
		//No need to update checking objective completion, we don't have greentext and this isn't going upstream.
	else
		explanation_text = "Free Objective"

/// Slight edit of the Obsessed "jealous" objective, tasking the killer to eliminate a randomly-chosen co-worker of the target.
/datum/objective/assassinate/jealous/update_explanation_text()
	..()
	if(target?.current && old)
		explanation_text = "Murder [target.name], [old]'s coworker, to eliminate a possible witness."
	else
		explanation_text = "Free Objective"

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

//Preferences preview icon

/datum/antagonist/contract_killer/get_preview_icon()
	var/mob/living/carbon/human/dummy/consistent/killer_dummy = new
	killer_dummy.dna.features["mcolor"] = "#9c38ab"
	killer_dummy.dna.features["tail_lizard"] = "Dark Tiger"
	killer_dummy.dna.features["snout"] = "Round"
	killer_dummy.dna.features["horns"] = "Ram"
	killer_dummy.dna.features["frills"] = "Aquatic"
	killer_dummy.dna.features["spines"] = "Aquatic"
	killer_dummy.set_species(/datum/species/lizard)

	var/icon/killer_icon = render_preview_outfit(preview_outfit, killer_dummy)
	killer_icon.Blend(icon('icons/effects/blood.dmi', "uniformblood"), ICON_OVERLAY)

	return finish_preview_icon(killer_icon)

/datum/outfit/contract_killer
	name = "Contract Killer (Preview only)"

	uniform = /obj/item/clothing/under/rank/civilian/hydroponics
	gloves = /obj/item/clothing/gloves/botanic_leather
	suit = /obj/item/clothing/suit/apron
	glasses = /obj/item/clothing/glasses/sunglasses
	neck = /obj/item/camera
	shoes = /obj/item/clothing/shoes/sneakers/black
	l_hand = /obj/item/knife/kitchen

/datum/outfit/contract_killer/post_equip(mob/living/carbon/human/H)
	for(var/obj/item/knife/kitchen/carried_knife in H.get_equipped_items(TRUE))
		carried_knife.add_mob_blood(H)
	H.regenerate_icons()

#undef CK_OBJ_INTEL
#undef CK_OBJ_POLAROID
#undef CK_OBJ_HEIRLOOM
#undef CK_OBJ_COVERUP

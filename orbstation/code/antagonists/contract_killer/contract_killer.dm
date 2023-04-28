/// A minor antagonist with the goal to kill a single crew member. Gets a few toys to do so.
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
	var/datum/objective/assassinate/kill_objective = new
	kill_objective.owner = owner
	var/datum/mind/target_mind = kill_objective.find_target()

	// The killer must first follow their target to gather intel in order to prepare and unlock their gear.
	var/datum/objective/gather_intel/intel = new
	intel.owner = owner
	intel.target = target_mind
	intel.start_ticking()
	objectives += intel

	objectives += kill_objective // Second objective is the kill itself.

	// Last objective will be a randomized directive on what to do with the body. This objective is the most optional one.
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

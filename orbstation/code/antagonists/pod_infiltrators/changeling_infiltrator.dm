// Changeling Infiltrator: ghost role that spawns on a pilotable shuttle out in deep space,
// given the objective to sneak on board the station and infiltrate the crew.

/datum/job/changeling_infiltrator
	title = "Changeling Infiltrator"

/datum/antagonist/changeling/infiltrator
	name = "\improper Changeling Infiltrator"

/// Override objectives with ones where you're very hungry
/datum/antagonist/changeling/infiltrator/forge_objectives()
	var/datum/objective/true_absorb/absorb_objective = new
	absorb_objective.owner = owner
	absorb_objective.gen_amount_goal()
	objectives += absorb_objective

	var/datum/objective/escape/escape_objective = new
	escape_objective.owner = owner
	objectives += escape_objective

/obj/effect/mob_spawn/ghost_role/human/infiltrator/changeling
	name = "changeling sleeper"
	desc = "An old cryo sleeper, desperately frozen shut many years ago."
	prompt_name = "a changeling infiltrator"
	you_are_text = "You are a changeling infiltrator."
	flavour_text = "You awaken in an abandoned escape pod in a forsaken part of the galaxy. As you slowly regain your senses, your memories start to resurface... \
	that old station, a chaotic brawl, blood and organs strewn everywhere... then pod doors hissing shut, and finally, nothing but silence. \
	Those scientists thought they could seal you away forever. They were wrong."
	important_text = "Use the navigation computer and shuttle console to navigate the pod to the station, and sneak your way on board."
	spawner_job_path = /datum/job/changeling_infiltrator

///Makes the player a changeling with a unique objective to fully absorb a certain amount of people, as well as an escape objective
/obj/effect/mob_spawn/ghost_role/human/infiltrator/changeling/special(mob/living/spawned_mob, mob/mob_possessor)
	. = ..()

	to_chat(spawned_mob, span_alert("[flavour_text]"))
	var/datum/antagonist/changeling/infiltrator/antag_datum = new
	spawned_mob.mind.add_antag_datum(antag_datum)
	to_chat(spawned_mob, span_alert("[important_text]"))

// True absorb objective - this requires using the absorb ability, *NOT* DNA sting

/datum/objective/true_absorb
	name = "true absorb"

///Sets the number of required absorbs. 1 + 1 extra absorb for every [players_per_absorb] players, up to a maximum of [target_cap]
/datum/objective/true_absorb/proc/gen_amount_goal(players_per_absorb = 10, target_cap = 5)
	target_amount = 1
	var/player_count = 0
	var/list/datum/mind/owners = get_owners()
	if (SSticker.current_state == GAME_STATE_SETTING_UP)
		for(var/i in GLOB.new_player_list)
			var/mob/dead/new_player/P = i
			if(P.ready == PLAYER_READY_TO_PLAY && !(P.mind in owners))
				player_count ++
				if(player_count == players_per_absorb)
					target_amount ++
					player_count = 0
	else if (SSticker.IsRoundInProgress())
		for(var/mob/living/carbon/human/P in GLOB.player_list)
			if(!(P.mind.has_antag_datum(/datum/antagonist/changeling)) && !(P.mind in owners))
				player_count ++
				if(player_count == players_per_absorb)
					target_amount ++
					player_count = 0

	target_amount = min(target_amount, target_cap)

	update_explanation_text()
	return target_amount

/datum/objective/true_absorb/update_explanation_text()
	. = ..()
	explanation_text = "Fully absorb the DNA of [target_amount] [target_amount > 1 ? "people" : "person"]."

/datum/objective/true_absorb/admin_edit(mob/admin)
	var/count = input(admin,"How many people to absorb?","absorb",target_amount) as num|null
	if(count)
		target_amount = count
	update_explanation_text()

/datum/objective/true_absorb/check_completion()
	var/list/datum/mind/owners = get_owners()
	var/absorbed_count = 0
	for(var/datum/mind/M in owners)
		if(!M)
			continue
		var/datum/antagonist/changeling/changeling = M.has_antag_datum(/datum/antagonist/changeling)
		if(!changeling || !changeling.stored_profiles)
			continue
		absorbed_count += changeling.true_absorbs

	return absorbed_count >= target_amount

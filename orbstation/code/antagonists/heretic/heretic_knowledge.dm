/// Proc to remove a specific knowledge path from a heretic
/datum/antagonist/heretic/proc/remove_knowledge(knowledge_path)
	var/datum/heretic_knowledge/to_unlearn = locate(knowledge_path) in researched_knowledge
	if(!to_unlearn)
		return
	researched_knowledge -= to_unlearn
	to_unlearn.on_lose(owner.current, src)

// GENERAL

/datum/heretic_knowledge/limited_amount/starting
	cost = 0

/// make more clear which knowledge is your sacrifice
/datum/heretic_knowledge/hunt_and_sacrifice
	name = "Heartbeat of the Mansus (Sacrifice)"

// heretic contract renegotiation concept

/// overwrite on proc to remove scheme of prometheus upon sacrificing someone
/datum/heretic_knowledge/hunt_and_sacrifice/on_finished_recipe(mob/living/user, list/selected_atoms, turf/loc)
	. = ..()
	if(!.)
		return FALSE
	var/datum/antagonist/heretic/our_heretic = IS_HERETIC(user)
	if(our_heretic.total_sacrifices > 1)
		return
	our_heretic.remove_knowledge(/datum/heretic_knowledge/prometheus_scheme)
	to_chat(user, span_hypnophrase(span_big("THE PACT OF BLOOD AND FLESH IS SEALED.")))


/// ritual that gives you knowledge and removes all of your objectives, similar to contract renegotiation
/datum/heretic_knowledge/prometheus_scheme
	name = "Scheme of Prometheus (No Objectives)"
	desc = "Allows you to use a candle to reject the desires of your masters and steal their power for yourself. \
		You will instantly gain 10 knowledge. You will no longer be able to sacrifice or ascend. \
		You can still gain knowledge from rifts and the Ritual of Knowledge."
	required_atoms = list(/obj/item/flashlight/flare/candle = 1)
	priority = MAX_KNOWLEDGE_PRIORITY
	route = PATH_START
	/// Whether we've done the ritual. Only doable once.
	var/was_completed = FALSE

/datum/heretic_knowledge/prometheus_scheme/can_be_invoked(datum/antagonist/heretic/invoker)
	return !was_completed

/datum/heretic_knowledge/prometheus_scheme/recipe_snowflake_check(mob/living/user, list/atoms, list/selected_atoms, turf/loc)
	return !was_completed

/datum/heretic_knowledge/prometheus_scheme/on_finished_recipe(mob/living/user, list/selected_atoms, turf/loc)
	var/datum/antagonist/heretic/our_heretic = IS_HERETIC(user)
	our_heretic.knowledge_points += 10
	was_completed = TRUE

	to_chat(user, span_boldnotice("[name] completed!"))
	to_chat(user, span_hypnophrase("You have grasped for the stars themselves and gained immense power!"))
	desc += " (Completed!)"
	reject_mansus(our_heretic, user)
	log_heretic_knowledge("[key_name(user)] completed a [name] at [worldtime2text()].")
	return TRUE

/// Proc that runs when you complete this ritual in order to cancel sacrifice objectives and remove the heartbeat of mansus knowledge
/datum/heretic_knowledge/prometheus_scheme/proc/reject_mansus(datum/antagonist/heretic/our_heretic, mob/living/user)
	our_heretic.remove_knowledge(/datum/heretic_knowledge/hunt_and_sacrifice)
	to_chat(user, span_hypnophrase(span_big("THE MANSUS REJECTS YOU. YOU CAN NO LONGER SACRIFICE TARGETS NOR ASCEND.")))

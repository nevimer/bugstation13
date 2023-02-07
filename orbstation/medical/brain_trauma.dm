/// Curated list of weird brain traumas we actually want to use in events
GLOBAL_LIST_INIT(orb_mysterious_brain_traumas, list(
		/datum/brain_trauma/magic/poltergeist,
		/datum/brain_trauma/magic/antimagic,
		/datum/brain_trauma/magic/stalker,
		/datum/brain_trauma/mild/hallucinations,
		/datum/brain_trauma/mild/healthy,
		/datum/brain_trauma/special/godwoken,
		/datum/brain_trauma/special/bluespace_prophet,
		/datum/brain_trauma/special/quantum_alignment,
		/datum/brain_trauma/special/death_whispers,
		/datum/brain_trauma/special/existential_crisis,
		/datum/brain_trauma/special/tenacity,
		/datum/brain_trauma/severe/hypnotic_trigger/random,
))

/// As hypnotic trigger but randomise the code phrase to several common-but-not-too-common words
/datum/brain_trauma/severe/hypnotic_trigger/random
	var/static/list/possible_phrases = list("Nanotrasen", "Syndicate", "ling", "Ian", "Poly", "Wizard", "Shuttle", "Bomb", "Help")

/datum/brain_trauma/severe/hypnotic_trigger/random/New(phrase)
	..()
	if(!phrase)
		trigger_phrase = pick(possible_phrases)

/// split personality override
/datum/brain_trauma/severe/split_personality
	name = "Possession"
	desc = "Patient's head wounds have allowed the dead to heavily influence them."
	scan_desc = "supernatural susceptibility "
	gain_text = span_warning("You feel like your head is full of dark whispers.")
	lose_text = span_notice("You feel quiet once more.")

/// if someone wants to juice this up more than this thats fine but just moving all around is probably decent enough
/datum/brain_trauma/severe/split_personality/on_gain()
	owner.AddComponent(/datum/component/deadchat_control/cardinal_movement, ANARCHY_MODE, list(
		"spin" = CALLBACK(owner, TYPE_PROC_REF(/mob, emote), "spin"),
		"flip" = CALLBACK(owner, TYPE_PROC_REF(/mob, emote), "flip"),
		), 7 SECONDS)

/datum/brain_trauma/severe/split_personality/on_lose()
	qdel(owner.GetComponent(/datum/component/deadchat_control/cardinal_movement))

/// have to override this bc split personality has its own on this
/datum/brain_trauma/severe/split_personality/on_life(delta_time, times_fired)
	return

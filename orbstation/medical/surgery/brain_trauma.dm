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
		/datum/brain_trauma/special/beepsky,
		/datum/brain_trauma/severe/hypnotic_trigger/random,
))

/// As hypnotic trigger but randomise the code phrase to several common-but-not-too-common words
/datum/brain_trauma/severe/hypnotic_trigger/random
	var/static/list/possible_phrases = list("Nanotrasen", "Syndicate", "ling", "Ian", "Poly", "Wizard", "Shuttle", "Bomb", "Help")

/datum/brain_trauma/severe/hypnotic_trigger/random/New(phrase)
	..()
	if(!phrase)
		trigger_phrase = pick(possible_phrases)

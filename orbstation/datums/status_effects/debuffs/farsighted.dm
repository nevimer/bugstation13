/// Farsighted
/datum/status_effect/grouped/farsighted
	id = "farsighted"
	tick_interval = -1
	alert_type = null

	/// Static list of signals that, when recieved, we add or remove the farsighted illiteracy
	var/static/list/update_signals = list(SIGNAL_ADDTRAIT(TRAIT_FARSIGHTED_CORRECTED), SIGNAL_REMOVETRAIT(TRAIT_FARSIGHTED_CORRECTED))

/datum/status_effect/grouped/farsighted/on_apply()
	RegisterSignals(owner, update_signals, PROC_REF(update_farsightedness))
	update_farsighted_literacy()
	return ..()

/datum/status_effect/grouped/farsighted/on_remove()
	UnregisterSignal(owner, update_signals)

	REMOVE_TRAIT(owner, TRAIT_ILLITERATE, FARSIGHT_TRAIT)
	return ..()

/datum/status_effect/grouped/farsighted/proc/update_farsightedness(datum/source)
	SIGNAL_HANDLER
	update_farsighted_literacy()

/datum/status_effect/grouped/farsighted/proc/should_be_farsighted()
	return !HAS_TRAIT(owner, TRAIT_FARSIGHTED_CORRECTED)

/datum/status_effect/grouped/farsighted/proc/update_farsighted_literacy()
	if(should_be_farsighted())
		ADD_TRAIT(owner, TRAIT_ILLITERATE, FARSIGHT_TRAIT)
	else
		REMOVE_TRAIT(owner, TRAIT_ILLITERATE, FARSIGHT_TRAIT)

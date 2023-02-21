/// Midround antagonists will not select mindshielded players.
/datum/dynamic_ruleset/midround/trim_list(list/L = list())
	. = ..()
	for (var/mob/candidate as anything in .)
		if (!HAS_TRAIT(candidate, TRAIT_MINDSHIELD))
			continue
		. -= candidate

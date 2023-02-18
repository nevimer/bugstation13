/datum/smite/deadchatpossession
	name = "Ghost Control"

/datum/smite/deadchatpossession/effect
	target.AddComponent(/datum/component/deadchat_control/cardinal_movement, ANARCHY_MODE, list(
		"spin" = CALLBACK(owner, TYPE_PROC_REF(/mob, emote), "spin"),
		"flip" = CALLBACK(owner, TYPE_PROC_REF(/mob, emote), "flip"),
		"fall" = CALLBACK(owner, TYPE_PROC_REF(/mob/living, Knockdown), 1 SECONDS),
		"drop" = CALLBACK(owner, TYPE_PROC_REF(/mob, drop_all_held_items)),
		"throw" = CALLBACK(owner, ),
		"shove" = CALLBACK(owner, ),
		), 7 SECONDS)

	to_chat(target, span_warning("You are now being possesed by ghosts!"))


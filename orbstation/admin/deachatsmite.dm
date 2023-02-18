
	owner.AddComponent(/datum/component/deadchat_control/cardinal_movement, ANARCHY_MODE, list(
		"spin" = CALLBACK(owner, TYPE_PROC_REF(/mob, emote), "spin"),
		"flip" = CALLBACK(owner, TYPE_PROC_REF(/mob, emote), "flip"),
		), 7 SECONDS)

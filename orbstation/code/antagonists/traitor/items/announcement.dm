/datum/uplink_item/badass/announcement
	name = "Intercept Announcement System"
	desc = "When purchased, you will be able to send one message on the stations announcement system. The syndicate can only perform this hack once per agent."
	item = /obj/effect/gibspawner/generic
	surplus = 0
	limited_stock = 1
	cost = 0
	restricted = TRUE
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)

/datum/uplink_item/badass/announcement/spawn_item(spawn_path, mob/user, datum/uplink_handler/uplink_handler, atom/movable/source)

	return source //For log icon

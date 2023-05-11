#define TRAITOR_ANNOUNCE_MAX_LEN 500

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
	var/announcement_text = tgui_input_text(user, "Insert message to be sent to the announcement system:", "Evil Message", "PREPARE FOR YOUR DOOM!", TRAITOR_ANNOUNCE_MAX_LEN)
	if(!announcement_text) // such as if the user hits "cancel"
		return source
	priority_announce(text = announcement_text, title = null, sound = 'sound/misc/announce.ogg', type = "Syndicate Captain", has_important_message = TRUE)

	return source //For log icon

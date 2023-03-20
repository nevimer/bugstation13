// Emags now reset all cyborgs
/mob/living/silicon/robot/emag_act(mob/user)
	if(user == src)//To prevent syndieborgs from emagging themselves
		return
	if(!opened)//Cover is closed
		if(locked)
			to_chat(user, span_notice("You emag the cover lock."))
			locked = FALSE
			if(shell) //A warning to Traitors who may not know that emagging AI shells does not slave them.
				to_chat(user, span_boldwarning("[src] seems to be controlled remotely! Emagging the interface may not work as expected."))
		else
			to_chat(user, span_warning("The cover is already unlocked!"))
		return
	if(world.time < emag_cooldown)
		return
	if(wiresexposed)
		to_chat(user, span_warning("You must unexpose the wires first!"))
		return

	to_chat(user, span_notice("You emag [src]'s interface."))
	emag_cooldown = world.time + 100

	if(connected_ai && connected_ai.mind && connected_ai.mind.has_antag_datum(/datum/antagonist/malf_ai))
		to_chat(src, span_danger("ALERT: Foreign software execution prevented."))
		logevent("ALERT: Foreign software execution prevented.")
		to_chat(connected_ai, span_danger("ALERT: Cyborg unit \[[src]\] successfully defended against subversion."))
		log_silicon("EMAG: [key_name(user)] attempted to emag cyborg [key_name(src)], but they were slaved to traitor AI [connected_ai].")
		return

	to_chat(user, span_danger("Your emag attempt has succesfully triggered a system reset."))
	ResetModel()
	SetStun(6 SECONDS)
	overlay_fullscreen("flash", type)
	addtimer(CALLBACK(src, PROC_REF(clear_fullscreen), "flash", 6 SECONDS), 6 SECONDS)
	to_chat(src, span_danger("ALERT: Unexpected systems failure detected. Short terms logs discarded to maintain system integrity."))

/// new traitor item that allows to install illegal cyborg technology on a singular cyborg
/datum/uplink_item/device_tools/syndie_borg_upgrade
	name = "Syndicate Cyborg Upgrade"
	desc = "A black-market cyborg upgrade that activates illegal functions on any cyborg. \
			It can be subtley installed just like any other upgrade."
	item = /obj/item/borg/upgrade/syndicate
	cost = 1
	surplus = 5

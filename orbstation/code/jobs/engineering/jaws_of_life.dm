// Jaws of Life can open windoors
/obj/machinery/door/window/try_to_crowbar(obj/item/tool, mob/user, forced = FALSE)
	if(!hasPower() || forced)
		if(density)
			open(BYPASS_DOOR_CHECKS)
		else
			close(BYPASS_DOOR_CHECKS)
		return
	if(!istype(tool, /obj/item/crowbar/power))
		to_chat(user, span_warning("The door's motors resist your efforts to force it!"))
		return
	if(panel_open)
		return
	if(!density)
		balloon_alert(user, "already open!")
		return
	add_fingerprint(user)
	user.visible_message(span_notice("[user] starts to pry open \the [name] with [tool]."))
	if(!tool.use_tool(src, user, pry_time, volume=80))
		return
	if(!loc)
		return
	if(prob(pry_break_chance))
		user.visible_message(span_danger("\The [name] breaks apart under the force of [tool]!"))
		deconstruct(disassembled = FALSE)
	else
		open(BYPASS_DOOR_CHECKS)

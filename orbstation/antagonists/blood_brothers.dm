/// todo attach to blood brothers, whitelist areas for projector, code projector to mark sent items as completed, code projector to summon crate

/datum/team/brother_team/forge_single_objective()
	if(!length(objectives))
		add_objective(new /datum/objective/steal/owned, needs_target = TRUE)
		return
	forge_hard_objective()

/// generates either killing or destroying another player or a complicated steal objective
/datum/team/brother_team/proc/forge_hard_objective()
	if(prob(66))
		if(LAZYLEN(active_ais()) && prob(100/GLOB.joined_player_list.len))
			add_objective(new /datum/objective/destroy, needs_target = TRUE)
		else if(prob(30))
			add_objective(new /datum/objective/maroon, needs_target = TRUE)
		else
			add_objective(new /datum/objective/assassinate, needs_target = TRUE)
	else
		var/static/list/steals = list(
			/datum/objective_item/steal/supermatter,
			/datum/objective_item/steal/nuke_core,
			/datum/objective_item/steal/functionalai,)
		var/hard_steal = pick(steals)
		add_objective(new hard_steal, needs_target = TRUE)


/obj/item/implant/holo_pad_projector
	name = "holographic bounty pad projector implant"
	implant_color = "r"
	var/datum/weakref/active_pad

/obj/item/implant/holo_pad_projector/activate()
	. = ..()
	var/obj/effect/holo_pad = active_pad?.resolve()
	if(!holo_pad)
		holo_pad = new(get_turf(src))
		active_pad = WEAKREF(holo_pad)
		return
	qdel(holo_pad)

/obj/effect/holo_pad
	name = "Syndicate Bounty Pad"
	desc = "A console used to complete illegal bounties for the Syndicate."
	alpha = 100
	icon = 'icons/obj/telescience.dmi'
	icon_state = "lpad-idle-off"
	///This is the icon_state that this telepad uses when it's not in use.
	var/idle_state = "lpad-idle-off"
	///This is the icon_state that this telepad uses when it's warming up for goods teleportation.
	var/warmup_state = "lpad-idle"
	///This is the icon_state to flick when the goods are being sent off by the telepad.
	var/sending_state = "lpad-beam"


/obj/effect/holo_pad/Initialize()
	. = ..()
	add_atom_colour("#ff7777", FIXED_COLOUR_PRIORITY)

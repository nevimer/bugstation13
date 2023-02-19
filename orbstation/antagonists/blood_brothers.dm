/// todo attach to blood brothers, whitelist areas for projector, code projector to mark sent items as completed, code projector to summon crate

/// equipping blood brothers

/datum/antagonist/brother/on_gain()
	. = ..()
	var/obj/item/implant/holo_pad_projector/bb_implant = new(owner.current)
	bb_implant.delivery_site = team.delivery_site
	bb_implant.implant(owner.current, silent = TRUE)

/// changes to objectives

/datum/objective/steal/owned/brothers
	var/delivery_site

/datum/objective/steal/owned/brothers/set_target(datum/objective_item/item)
	. = ..()
	if(!item)
		return
	explanation_text = "Steal [targetinfo.name] and deliver it to the Syndicate by using your bounty pad projector implant at [delivery_site]."

/datum/team/brother_team
	/// Area in the station where you will use your implant to deliver your item for extra gear
	var/area/delivery_site
	/// whitelist of areas chosen because you do not have to break into them and could potentially be seen
	var/static/list/delivery_whitelist = list(
		/area/station/hallway/secondary/exit/departure_lounge,
		/area/station/hallway/secondary/entry,
		/area/station/commons/dorms,
		/area/station/commons/dorms/laundry,
		/area/station/commons/toilet,
		/area/station/commons/lounge,
		/area/station/commons/fitness,
		/area/station/commons/vacant_room/office,
		/area/station/commons/vacant_room/commissary,
		/area/station/commons/storage/tools,
		/area/station/commons/storage/primary,
		/area/station/service/cafeteria,
		/area/station/service/kitchen/diner,
		/area/station/service/bar,
		/area/station/service/library,
		/area/station/service/chapel,
		/area/station/service/hydroponics/garden,
		/area/station/holodeck,
		/area/station/hallway/secondary/exit,
		/area/station/maintenance/tram,
	)

/datum/team/brother_team/New(starting_members)
	. = ..()
	var/list/delivery_selection = list()
	for(var/area in delivery_whitelist)
		if(!(area in GLOB.the_station_areas))
			continue
		delivery_selection += area
	delivery_site = pick(delivery_selection)

/datum/team/brother_team/forge_single_objective()
	if(!length(objectives))
		var/datum/objective/steal/owned/brothers/steal_objective = new()
		steal_objective.delivery_site = initial(delivery_site.name)
		add_objective(steal_objective, needs_target = TRUE)
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


/// new blood brother items

/obj/item/implant/holo_pad_projector
	name = "holographic bounty pad projector implant"
	implant_color = "r"
	/// Weak reference to if the pad has been activated by this implant or not
	var/datum/weakref/active_pad
	/// Area where the implant will activate
	var/delivery_site

/obj/item/implant/holo_pad_projector/activate()
	. = ..()
	var/obj/effect/holo_pad/syndie_pad = active_pad?.resolve()
	if(syndie_pad)
		qdel(syndie_pad)
		return
	if(!istype(get_area(src), delivery_site))
		imp_in.balloon_alert(imp_in, "incorrect area!")
		return
	syndie_pad = new(get_turf(src))
	active_pad = WEAKREF(syndie_pad)

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

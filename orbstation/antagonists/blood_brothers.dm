/// todo code projector to mark sent items as completed, code projector to summon crate, hard stealk objectives do not work right now

/// equipping blood brothers

/datum/antagonist/brother/on_gain()
	. = ..()
	var/datum/objective/steal/owned/brothers/light_steal = locate() in objectives
	if(!light_steal)
		return
	var/obj/item/implant/holo_pad_projector/bb_implant = new(owner.current)
	bb_implant.brother_bounty = light_steal.steal_target
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
	icon = 'icons/mob/actions/actions_items.dmi'
	icon_state = "bci_wireless"
	implant_color = "r"
	/// Weak reference to if the pad has been activated by this implant or not
	var/datum/weakref/active_pad
	/// Area where the implant will activate
	var/delivery_site
	///The item that the blood brother has to steal
	var/brother_bounty

/obj/item/implant/holo_pad_projector/activate()
	. = ..()
	var/obj/effect/holo_pad/syndie_pad = active_pad?.resolve()
	if(syndie_pad)
		qdel(syndie_pad)
		return
	if(!istype(get_area(src), delivery_site))
		imp_in.balloon_alert(imp_in, "incorrect area!")
		return
	var/turf/our_turf = get_turf(src)
	if(our_turf.is_blocked_turf(exclude_mobs = TRUE))
		imp_in.balloon_alert(imp_in, "blocked!")
		return
	syndie_pad = new(our_turf)
	syndie_pad.brother_bounty = brother_bounty
	active_pad = WEAKREF(syndie_pad)

/// syndicate holo bounty pad capable of sending items to the syndicate in exchange for some gear.
/obj/effect/holo_pad
	name = "Syndicate Bounty Pad"
	desc = "A console used to complete illegal bounties for the Syndicate."
	alpha = 150
	icon = 'icons/obj/telescience.dmi'
	icon_state = "lpad-idle"
	///The item that it will accept and mark as complete
	var/brother_bounty

/obj/effect/holo_pad/Initialize()
	. = ..()
	add_atom_colour("#ff3737", FIXED_COLOUR_PRIORITY)
	var/static/list/connections = list(COMSIG_ATOM_ENTERED = PROC_REF(on_entered))
	AddElement(/datum/element/connect_loc, connections)

/obj/effect/holo_pad/proc/on_entered(datum/source, atom/movable/possible_bounty)
	SIGNAL_HANDLER
	if(!istype(possible_bounty, brother_bounty))
		return
	complete_light_steal(possible_bounty)

/obj/effect/holo_pad/proc/complete_light_steal(atom/stolen_thing)
	qdel(stolen_thing)
	playsound(loc, 'sound/machines/wewewew.ogg', 70, TRUE)
	new /obj/effect/temp_visual/delivery_flash(loc)
	spawn_syndicrate()
	qdel(src)

/obj/effect/holo_pad/proc/spawn_syndicrate()
	var/datum/supply_pack/misc/syndicate/brother_pack = new
	var/obj/structure/closet/crate/brother_crate = brother_pack.generate()
	brother_crate.locked = FALSE
	brother_crate.icon_state = "syndicrate"
	brother_crate.update_appearance(UPDATE_ICON)
	var/list/landing_zones = list()
	for(var/turf/possible in range(1, loc))
		if(possible.is_blocked_turf(exclude_mobs = TRUE))
			continue
		landing_zones += possible
	podspawn(list(
		"target" = length(landing_zones) ? pick(landing_zones) : loc,
		"style" = STYLE_SYNDICATE,
		"spawn" = brother_crate,
	))


/obj/effect/temp_visual/delivery_flash
	duration = 0.8 SECONDS
	icon_state = "medi_holo"

/obj/effect/temp_visual/delivery_flash/Initialize()
	. = ..()
	add_atom_colour("#ff3737", FIXED_COLOUR_PRIORITY)

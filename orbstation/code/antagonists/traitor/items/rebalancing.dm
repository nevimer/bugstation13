/obj/item/melee/powerfist
	force = 15 // Little bit less, mostly we want the knockback and not the damage

/datum/uplink_item/dangerous/doublesword
	purchasable_from = UPLINK_NUKE_OPS

/obj/vehicle/sealed/car/clowncar
	escape_time = 15 SECONDS // Actually longer, but we removed the requirement to stay still

/obj/vehicle/sealed/car/clowncar/Initialize(mapload)
	. = ..()
	emag_act() // Always use emag behaviour, it's silly for this item to upgrade something anyway

/datum/armor/mod_theme_infiltrator // More similar to nuke op, still a bit better
	melee = 20
	bullet = 30
	laser = 20
	energy = 20
	bomb = 40
	fire = 50
	acid = 90
	wound = 25

// This item is incompatible with using LOOC for consent and thus should not be enabled
/datum/uplink_item/device_tools/hypnotic_grenade
	purchasable_from = NONE

/datum/uplink_item/stealthy_tools/randomize
	name = "Trigger Unfortunate Occurence"
	desc = "When purchased, syndicate probabilty matrixes will cause a random event to occur on the station."
	item = /obj/effect/gibspawner/generic
	surplus = 0
	cost = 1
	progression_minimum = 10 MINUTES
	restricted = TRUE
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)

/datum/uplink_item/stealthy_tools/randomize/spawn_item(spawn_path, mob/user, datum/uplink_handler/uplink_handler, atom/movable/source)
	SSevents.spawnEvent()
	return source //For log icon

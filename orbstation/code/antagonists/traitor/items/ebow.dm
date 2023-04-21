#define MAX_EBOW_CHARGE 6

/datum/uplink_item/stealthy_weapons/crossbow
	desc = "A short bow mounted across a tiller in miniature. \
	Small enough to fit into a pocket or slip into a bag unnoticed. \
	It will synthesize and fire bolts tipped with a debilitating \
	toxin that will damage and disorient targets, causing them to \
	slur as if inebriated. It can produce an infinite number \
	of bolts, but can only be fired once every two seconds. \
	After firing six shots, its mechanism must be manually rewound."

/obj/item/gun/energy/recharge/ebow
	desc = "A weapon favored by syndicate stealth specialists. It generates its own ammo, but its internal battery must be rewound after a few shots."
	/// How many shots can you fire before needing to pump it?
	var/charges = MAX_EBOW_CHARGE

/obj/item/gun/energy/recharge/ebow/examine(mob/user)
	. = ..()
	. += span_notice("It can be fired [charges] more times before it needs to be rewound.")

/obj/item/gun/energy/recharge/ebow/can_shoot()
	. = ..()
	if (!.)
		return FALSE
	return charges > 0

/obj/item/gun/energy/recharge/ebow/shoot_with_empty_chamber(mob/living/user)
	if (charges > 0)
		return ..()
	balloon_alert(user, "needs winding!")
	playsound(src, dry_fire_sound, 30, TRUE)

/obj/item/gun/energy/recharge/ebow/shoot_live_shot(mob/living/user, pointblank = 0, atom/pbtarget = null, message = 1)
	. = ..()
	charges--

/obj/item/gun/energy/recharge/ebow/attack_self(mob/living/user)
	. = ..()
	if (charges == MAX_EBOW_CHARGE)
		return
	balloon_alert(user, "rewinding...")
	if(!do_after(user, 6 SECONDS, target = src, interaction_key = REF(src)))
		return
	balloon_alert(user, "recharged!")
	charges = MAX_EBOW_CHARGE

#undef MAX_EBOW_CHARGE

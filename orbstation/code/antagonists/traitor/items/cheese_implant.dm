/**
 * Traitor Ratfolk item.
 * Use it to quickly inject cheese into your system.
 */
/obj/item/implant/cheese
	name = "cheese injector"
	desc = "Gives you a tactical boost of cheesiment when you need it. Internal microbiota and a dairy condenser refill the resevoir after use."
	implant_color = "r"
	actions_types = null
	var/datum/action/cooldown/cheese_injection/cheesy_action

/obj/item/implant/cheese/Initialize(mapload)
	. = ..()
	cheesy_action = new(src)

/obj/item/implant/cheese/Destroy()
	QDEL_NULL(cheesy_action)
	return ..()

/obj/item/implant/cheese/implant(mob/living/target, mob/user, silent, force)
	. = ..()
	if (!.)
		return
	cheesy_action?.Grant(target)
	return TRUE

/obj/item/implant/cheese/removed(mob/living/source, silent, special)
	. = ..()
	if (!.)
		return
	cheesy_action?.Remove(source)
	return TRUE

/// Action which puts cheese in you
/datum/action/cooldown/cheese_injection
	name = "Cheese Injection"
	desc = "Injects a tactical boost of the good stuff from a regenerating reserve."
	cooldown_time = 3 MINUTES
	cooldown_rounding = 0
	button_icon = 'icons/mob/actions/actions_animal.dmi'
	background_icon_state = "bg_clock"
	overlay_icon_state = "bg_clock_border"
	button_icon_state = "coffer" // Close enough
	/// How much cheese to add?
	var/injected_volume = 10

/datum/action/cooldown/cheese_injection/IsAvailable(feedback)
	. = ..()
	if (!.)
		return
	if (!iscarbon(owner))
		if (feedback)
			owner.balloon_alert(owner, "no veins!")
		return FALSE
	return TRUE

/datum/action/cooldown/cheese_injection/Activate(atom/target)
	. = ..()
	var/datum/reagents/cheese_holder = new()
	cheese_holder.add_reagent(/datum/reagent/consumable/cheese, injected_volume)
	cheese_holder.trans_to(owner, cheese_holder.total_volume)
	owner.balloon_alert(owner, "injected")

/// Allow it to be implanted
/obj/item/implanter/cheese
	name = "implanter (cheese injector)"
	imp_type = /obj/item/implant/cheese

/obj/item/implantcase/cheese
	name = "implant case - 'Cheese Injector'"
	desc = "A glass case containing a cheese implant."
	imp_type = /obj/item/implant/cheese

/// And put it in a box
/obj/item/storage/box/syndie_kit/imp_cheese
	name = "cheese implant box"

/obj/item/storage/box/syndie_kit/imp_cheese/PopulateContents()
	new /obj/item/implanter/cheese(src)

/// You should probably be able to buy it
/datum/uplink_item/species_restricted/cheese_injector
	name = "Cheese Injector Implant"
	desc = "A subdermal injector triggered by nerve interface to provide a tactical cheese boost on demand. \
		Engineered microbiota and a dairy condenser slowly refill the internal resevoir after use. \
		Warning: Overuse may lead to hunger, drowsiness, and irritability."
	item = /obj/item/storage/box/syndie_kit/imp_cheese
	cost = 3
	restricted_species = list(SPECIES_RATFOLK)
	surplus = 5

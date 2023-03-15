/// Drinks
// Removed fatness insult
/datum/glass_style/drinking_glass/fernet_cola
	desc = "A sawed-off cola bottle filled with Fernet Cola. Nothing better for avoiding a trip to the vomitorium."

// No saving this one, and it's on some maps. Replace it with slime wine and qdel it on load.
/obj/item/reagent_containers/cup/glass/bottle/lizardwine/Initialize(mapload, vol)
	. = ..()
	new /obj/item/reagent_containers/cup/glass/bottle/slimewine(loc)
	return INITIALIZE_HINT_QDEL

// Makes some other things easier if this reagent still technically exists.
/datum/reagent/consumable/ethanol/lizardwine
	description = "A rare vintage wine brewed in awkward commemoration of Human-Tiziran first contact. Popular among collectors and no one else."
	quality = NONE
	taste_description = "soured diplomatic relations"

/datum/reagent/consumable/ethanol/planet_cracker
	description = "A sobering memorial to the eighth-or-ninth most distant non-asteroid object in the Sol system."
	taste_description = "tiresome nomenclative discourse"

/datum/glass_style/drinking_glass/planet_cracker
	desc = "Two hundred years ago, the debate over whether or not Pluto should still be a planet was brought to an explosive end when the dwarf planet was inadvertently cracked in half in a TerraGov weapons test gone wrong. It's unclear whether this drink was made to memorialize Pluto or merely celebrate the end of the discourse."

// No longer has an overdose.
/datum/reagent/consumable/char
	description = "Essence of the grill."
	overdose_threshold = 0 //no overdose

/datum/reagent/consumable/monkey_energy
	overdose_threshold = 0 //no overdose

/// Drugs
/datum/reagent/drug/bath_salts
	name = "Chaos Salts"
	description = "Makes you impervious to stuns and grants a stamina regeneration buff, but twists your mind into unpredictable spirals that make fighting interesting."
	taste_description = "entropy"

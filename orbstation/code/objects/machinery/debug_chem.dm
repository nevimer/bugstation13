//Debug chem dispensers for admin and/or sandbox purposes
//
//if there's a way to have the stock cell be an infinite cell by default i would love to do that so it has infinite energy
//if any particular chemicals are troublesome, it should be easy enough to make a blacklist

/obj/machinery/chem_dispenser/debug // base object, dont use this it doesnt really do anything
	name = "debug chem dispenser (ERROR)"
	desc = "You should ahelp if you're seeing this."
	max_integrity = 999999
	integrity_failure = 0.01
	interaction_flags_machine = INTERACT_MACHINE_OPEN | INTERACT_MACHINE_ALLOW_SILICON | INTERACT_MACHINE_OFFLINE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	use_power = NO_POWER_USE
	idle_power_usage = 0
	upgrade_reagents = list()
	emagged_reagents = list()

/obj/machinery/chem_dispenser/debug/toxins
	name = "debug chem dispenser (toxins)"
	desc = "Creates and dispenses chemicals. This one is full of toxins."

/obj/machinery/chem_dispenser/debug/toxins/Initialize(mapload)
	. = ..()
	dispensable_reagents = subtypesof(/datum/reagent/toxin)


/obj/machinery/chem_dispenser/debug/medicine
	name = "debug chem dispenser (medicine)"
	desc = "Creates and dispenses chemicals. This one is full of medicines."

/obj/machinery/chem_dispenser/debug/medicine/Initialize(mapload)
	. = ..()
	dispensable_reagents = subtypesof(/datum/reagent/medicine)


/obj/machinery/chem_dispenser/debug/etc
	name = "debug chem dispenser (etc)"
	desc = "Creates and dispenses chemicals. This one is full of whatever."

/obj/machinery/chem_dispenser/debug/etc/Initialize(mapload)
	. = ..()
	dispensable_reagents = subtypesof(/datum/reagent) - subtypesof(/datum/reagent/medicine) - subtypesof(/datum/reagent/consumable) - subtypesof(/datum/reagent/toxin) - - subtypesof(/datum/reagent/blob)

//DANGER! THIS ONE IS PROBABLY GOING TO LAG SHIT
/obj/machinery/chem_dispenser/debug/all
	name = "debug chem dispenser (ultimate)"
	desc = "Creates and dispenses chemicals. This one is full of EVERY CHEMICAL KNOWN (AND UNKNOWN) TO SCIENCE. Use with caution."

/obj/machinery/chem_dispenser/debug/all/Initialize(mapload)
	. = ..()
	dispensable_reagents = subtypesof(/datum/reagent) - subtypesof(/datum/reagent/blob) //i know it says every chemical but theres just no point in including the blob chems


/obj/machinery/chem_dispenser/drinks/beer/debug
	name = "debug booze dispenser"
	desc = "Creates and dispenses chemicals. This one is full of alcoholic drinkies."
	max_integrity = 999999
	integrity_failure = 0.01
	interaction_flags_machine = INTERACT_MACHINE_OPEN | INTERACT_MACHINE_ALLOW_SILICON | INTERACT_MACHINE_OFFLINE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	use_power = NO_POWER_USE
	idle_power_usage = 0
	dispensed_temperature = WATER_MATTERSTATE_CHANGE_TEMP
	upgrade_reagents = list()
	emagged_reagents = list()

/obj/machinery/chem_dispenser/drinks/beer/debug/Initialize(mapload)
	. = ..()
	dispensable_reagents = subtypesof(/datum/reagent/consumable/ethanol)

/obj/machinery/chem_dispenser/drinks/beer/debug/non_alc
	name = "debug beverage dispenser"
	desc = "Creates and dispenses chemicals. This one is full of non-alcoholic drinkies."
	icon_state = "soda_dispenser"
	base_icon_state = "soda_dispenser"

/obj/machinery/chem_dispenser/drinks/beer/debug/non_alc/Initialize(mapload)
	. = ..()
	dispensable_reagents = subtypesof(/datum/reagent/consumable) - subtypesof(/datum/reagent/consumable/ethanol)



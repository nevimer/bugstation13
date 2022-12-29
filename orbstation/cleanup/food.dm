
// This used to indistinguishably turn you into a cyborg
/obj/item/food/pizza/margherita/robo
	desc = "This one seems to have been prepared for a cyborg."
	food_reagents = list(/datum/reagent/fuel = 40, /datum/reagent/silicon = 20, /datum/reagent/consumable/nutriment = 25, /datum/reagent/iron = 8, /datum/reagent/consumable/tomatojuice = 6, /datum/reagent/consumable/nutriment/vitamin = 5)

// Removed fatness insult
/datum/glass_style/drinking_glass/fernet_cola
	desc = "A sawed-off cola bottle filled with Fernet Cola. Nothing better for avoiding a trip to the vomitorium."

/obj/item/food/burger/catburger
	desc = "Specially formulated by, for, and of cats."

// No saving this one, and it's on some maps
/obj/item/reagent_containers/cup/glass/bottle/lizardwine/Initialize(mapload, vol)
	. = ..()
	return INITIALIZE_HINT_QDEL

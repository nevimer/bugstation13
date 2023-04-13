/datum/crafting_recipe/a357
	name = ".357 bullet"
	result = /obj/item/ammo_casing/a357
	reqs = list(
		/obj/item/ammo_casing/a357_brass = 1, //
		/datum/reagent/gunpowder = 20, // This is the current amount required for the Improvised shotshells
		/obj/item/stack/sheet/plasteel = 1,
	)
	tool_behaviors = list(TOOL_WIRECUTTER)
	time = 1 SECONDS
	category = CAT_WEAPON_AMMO

/obj/item/ammo_casing/a357
	icon_state = "a357"

/obj/item/ammo_casing/a357_brass
	name = ".357 unloaded casing"
	desc = "A fresh new brass case for a .357 shell. Necessary for making new rounds, but not enough on it's own."
	icon_state = "brass-as357"
	projectile_type = null

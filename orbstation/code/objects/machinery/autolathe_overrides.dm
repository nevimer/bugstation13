/// you can no longer print straight ammo from the autolathe. More effort is required!
/datum/design/a357
	build_type = null

/datum/design/a357/brass
	name = ".357 unloaded casing"
	id = "a357_brass"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 4000)
	build_path = /obj/item/ammo_casing/a357/brass
	category = list(
		RND_CATEGORY_HACKED,
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

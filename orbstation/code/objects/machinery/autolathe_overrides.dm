/// you can no longer print straight ammo from the autolathe. More effort is required!
/datum/design/a357
	build_type = null
	category = null
	departmental_flags = null

/datum/design/a357_brass
	name = ".357 unloaded casing"
	id = "a357_brass"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 4000)
	build_path = /obj/item/ammo_casing/a357_brass
	category = list(
		RND_CATEGORY_HACKED,
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/special_hotload
	name = ".38 Special Hot Load bullet (VERY LETHAL)"
	id = "special_hotload"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 3000)
	build_path = /obj/item/ammo_casing/c38/special_hotload
	category = list(
		RND_CATEGORY_HACKED,
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

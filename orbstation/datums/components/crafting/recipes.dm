/datum/crafting_recipe/boggle
	name = "Boggle Goggles"
	result = /obj/item/clothing/glasses/boggle
	time = 2 SECONDS
	reqs = list(/obj/item/organ/internal/eyes = 1, /obj/item/stack/sheet/cloth = 1)
	category = CAT_MISC

/datum/crafting_recipe/lance
	name = "Explosive Lance (Grenade)"
	result = /obj/item/spear/explosive
	reqs = list(/obj/item/spear = 1,
				/obj/item/grenade = 1)
	blacklist = list(/obj/item/spear/bonespear, /obj/item/spear/bamboospear)
	parts = list(/obj/item/spear = 1,
				/obj/item/grenade = 1)
	time = 1.5 SECONDS
	category = CAT_WEAPON_MELEE

/datum/crafting_recipe/medpatch
	name = "Medical Hud Eyepatch"
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	result = /obj/item/clothing/glasses/hud/health/eyepatch
	reqs = list(/obj/item/clothing/glasses/eyepatch = 1,
				/obj/item/clothing/glasses/hud/health = 1,
				/obj/item/stack/cable_coil = 5)
	time = 2 SECONDS
	category = CAT_EQUIPMENT

/datum/crafting_recipe/medgar
	name = "Medical Hud Gar Glasses"
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	result = /obj/item/clothing/glasses/hud/health/sunglasses/gars
	reqs = list(/obj/item/clothing/glasses/sunglasses/gar = 1,
				/obj/item/clothing/glasses/hud/health = 1,
				/obj/item/stack/cable_coil = 5)
	time = 2 SECONDS
	category = CAT_EQUIPMENT

/datum/crafting_recipe/medgigar
	name = "Giga Medical Hud Gar Glasses"
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	result = /obj/item/clothing/glasses/hud/health/sunglasses/gars/giga
	reqs = list(/obj/item/clothing/glasses/sunglasses/gar/giga = 1,
				/obj/item/clothing/glasses/hud/health = 1,
				/obj/item/stack/cable_coil = 5)
	time = 2 SECONDS
	category = CAT_EQUIPMENT

/datum/crafting_recipe/diagpatch
	name = "Diagnostic Hud Eyepatch"
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	result = /obj/item/clothing/glasses/hud/diagnostic/eyepatch
	reqs = list(/obj/item/clothing/glasses/eyepatch = 1,
				/obj/item/clothing/glasses/hud/diagnostic = 1,
				/obj/item/stack/cable_coil = 5)
	time = 2 SECONDS
	category = CAT_EQUIPMENT

/datum/crafting_recipe/diaggar
	name = "Diagnostic Hud Gar Glasses"
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	result = /obj/item/clothing/glasses/hud/diagnostic/sunglasses/gars
	reqs = list(/obj/item/clothing/glasses/sunglasses/gar = 1,
				/obj/item/clothing/glasses/hud/diagnostic = 1,
				/obj/item/stack/cable_coil = 5)
	time = 2 SECONDS
	category = CAT_EQUIPMENT

/datum/crafting_recipe/diaggigar
	name = "Giga Diagnostic Hud Gar Glasses"
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	result = /obj/item/clothing/glasses/hud/diagnostic/sunglasses/gars/giga
	reqs = list(/obj/item/clothing/glasses/sunglasses/gar/giga = 1,
				/obj/item/clothing/glasses/hud/diagnostic = 1,
				/obj/item/stack/cable_coil = 5)
	time = 2 SECONDS
	category = CAT_EQUIPMENT

/datum/crafting_recipe/scipatch
	name = "Science Hud Eyepatch"
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	result = /obj/item/clothing/glasses/science/eyepatch
	reqs = list(/obj/item/clothing/glasses/eyepatch = 1,
				/obj/item/clothing/glasses/science = 1,
				/obj/item/stack/cable_coil = 5)
	time = 2 SECONDS
	category = CAT_EQUIPMENT

/datum/crafting_recipe/scigar
	name = "Science Hud Gar Glasses"
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	result = /obj/item/clothing/glasses/sunglasses/chemical/gars
	reqs = list(/obj/item/clothing/glasses/sunglasses/gar = 1,
				/obj/item/clothing/glasses/science = 1,
				/obj/item/stack/cable_coil = 5)
	time = 2 SECONDS
	category = CAT_EQUIPMENT

/datum/crafting_recipe/scigigar
	name = "Giga Science Hud Gar Glasses"
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	result = /obj/item/clothing/glasses/sunglasses/chemical/gars/giga
	reqs = list(/obj/item/clothing/glasses/sunglasses/gar/giga = 1,
				/obj/item/clothing/glasses/science = 1,
				/obj/item/stack/cable_coil = 5)
	time = 2 SECONDS
	category = CAT_EQUIPMENT

/datum/crafting_recipe/secpatch
	name = "Security Hud Eyepatch"
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	result = /obj/item/clothing/glasses/hud/security/sunglasses/eyepatch
	reqs = list(/obj/item/clothing/glasses/eyepatch = 1,
				/obj/item/clothing/glasses/hud/security = 1,
				/obj/item/stack/cable_coil = 5)
	time = 2 SECONDS
	category = CAT_EQUIPMENT

/datum/crafting_recipe/secgar
	name = "Security Hud Gar Glasses"
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	result = /obj/item/clothing/glasses/hud/security/sunglasses/gars
	reqs = list(/obj/item/clothing/glasses/sunglasses/gar = 1,
				/obj/item/clothing/glasses/hud/security = 1,
				/obj/item/stack/cable_coil = 5)
	time = 2 SECONDS
	category = CAT_EQUIPMENT

/datum/crafting_recipe/secgigar
	name = "Giga Security Hud Gar Glasses"
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	result = /obj/item/clothing/glasses/hud/security/sunglasses/gars/giga
	reqs = list(/obj/item/clothing/glasses/sunglasses/gar/giga = 1,
				/obj/item/clothing/glasses/hud/security = 1,
				/obj/item/stack/cable_coil = 5)
	time = 2 SECONDS
	category = CAT_EQUIPMENT

/datum/crafting_recipe/medmeson
	name = "Medical Meson Gar Glasses"
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	result = /obj/item/clothing/glasses/hud/health/meson
	reqs = list(/obj/item/clothing/glasses/meson/gar = 1,
				/obj/item/clothing/glasses/hud/health = 1,
				/obj/item/stack/cable_coil = 5)
	time = 2 SECONDS
	category = CAT_EQUIPMENT

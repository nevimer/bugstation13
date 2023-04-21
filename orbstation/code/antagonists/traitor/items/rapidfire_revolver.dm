/obj/item/gun/ballistic/revolver/rapidfire //The Gun
	name = "DonkCo. New Syndie"
	desc = "A Donk Corporation take on the classic Syndicate choice of a .357 Magnum revolver. It has a match trigger and an extended, textured hammer designed for quick fanning, but the shortened barrel decreases effective accuracy outside of close quarters. It uses .38 Special Hot Load rounds instead of the usual .357 caliber rounds."
	icon = 'orbstation/icons/obj/weapons/weapons.dmi'
	icon_state = "rapidfire_revolver"
	initial_caliber = CALIBER_38
	spread = 23
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rapidfire_revolver

/obj/item/ammo_box/magazine/internal/cylinder/rapidfire_revolver //The magazine
	name = "DonkCo. New Syndie cylinder"
	ammo_type = /obj/item/ammo_casing/c38/special_hotload
	caliber = CALIBER_38
	max_ammo = 7

/datum/uplink_item/dangerous/rapidfire //Lets you buy it
	name = "DonkCo. New Syndie"
	desc = "A Donk Corporation take on the classic Syndicate choice of a .357 Magnum revolver. It has a match trigger and an extended, textured hammer designed for quick fanning, but the shortened barrel decreases effective accuracy outside of close quarters. It uses .38 Special Hot Load rounds instead of the usual .357 caliber rounds."
	item = /obj/item/gun/ballistic/revolver/rapidfire
	cost = 11
	surplus = 50
	progression_minimum = 30 MINUTES
	illegal_tech = FALSE

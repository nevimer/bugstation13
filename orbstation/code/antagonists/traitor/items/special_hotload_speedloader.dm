/obj/item/ammo_box/c38/special_hotload
	name = "Speed Loader (.38 Special Hot Load)"
	desc = "Designed to quickly reload the DonkCo. New Syndie."
	icon_state = "357"
	ammo_type = /obj/item/ammo_casing/c38/special_hotload
	max_ammo = 7
	caliber = CALIBER_38
	multiple_sprites = AMMO_BOX_PER_BULLET
	item_flags = NO_MAT_REDEMPTION

/datum/uplink_item/ammo/special_hotload
	name = ".38 Special Hot Load Speed Loader"
	desc = "A speed loader that contains seven additional .38 Special Hot Load rounds; usable with the DonkCo. New Syndie. \
			For when you really need to fan that hammer."
	progression_minimum = 30 MINUTES
	item = /obj/item/ammo_box/c38/special_hotload
	cost = 3
	illegal_tech = FALSE

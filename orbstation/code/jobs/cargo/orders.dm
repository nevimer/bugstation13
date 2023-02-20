/datum/supply_pack/goody/hamhelmet
	name = "Ham Helmet Two Pack"
	desc = "Contains two Ham Helmets, one for you, and one for your beloved, be they a person or a corgi."
	cost = PAYCHECK_CREW * 3
	contains = list(/obj/item/clothing/head/helmet/ham,
					/obj/item/clothing/head/helmet/ham,
					/obj/item/paper/guides/hamhelmet)

/datum/supply_pack/goody/magazine
	name = "Magazine"
	desc = "Contains one magazine from the Nanotrasen Magazine Library. Don't forget to subscribe to Magazines Monthly!"
	cost = PAYCHECK_CREW * 2
	contains = list(/obj/effect/spawner/random/entertainment/magazine)

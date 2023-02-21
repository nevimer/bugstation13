/obj/machinery/vending/boozeomat
	orb_product_categories = list(
		list(
			"name" = "Alcoholic",
			"products" = list(
				/obj/item/reagent_containers/cup/glass/bottle/kortara = 5,
			),
		),
	)
	orb_premium = list(
		/obj/item/reagent_containers/cup/glass/bottle/mushi_kombucha = 5,
	)

/obj/item/reagent_containers/cup/glass/bottle/kortara
	name = "Imperial Reserve Kortara"
	desc = "A bottle of sweet kortara, imported directly from Tizira."
	icon = 'orbstation/icons/obj/drinks.dmi'
	icon_state = "kortara"
	volume = 100
	list_reagents = list(/datum/reagent/consumable/ethanol/kortara = 100)

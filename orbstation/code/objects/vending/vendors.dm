/obj/machinery/vending
	/// Extra items to add to the products list
	var/list/orb_products = list()
	/// Extra items to add to the premium list
	var/list/orb_premium = list()
	/// Extra items to add to categorised lists
	var/list/orb_product_categories = list()

/obj/machinery/vending/Initialize(mapload)
	products += orb_products
	premium += orb_premium
	for (var/list/orb_category in orb_product_categories)
		for (var/list/category in product_categories)
			if (orb_category["name"] != category["name"])
				continue
			category["products"] += orb_category["products"]
			break
	return ..()

/obj/machinery/vending/wardrobe/cargo_wardrobe
    orb_premium = list(
        /obj/item/toy/plush/felfyplushie = 1,
    )

/obj/machinery/vending/wardrobe/bar_wardrobe
    orb_premium = list(
        /obj/item/toy/plush/pennyplushie = 1,
    )

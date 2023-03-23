/obj/machinery/vending
	/// Extra items to add to the products list
	var/list/orb_products = list()
	/// Extra items to add to the premium list
	var/list/orb_premium = list()
	///Extra items to add to the contraband list
	var/list/orb_contraband = list()
	/// Extra items to add to categorised lists
	var/list/orb_product_categories = list()

/obj/machinery/vending/Initialize(mapload)
	products += orb_products
	premium += orb_premium
	contraband += orb_contraband
	for (var/list/orb_category in orb_product_categories)
		for (var/list/category in product_categories)
			if (orb_category["name"] != category["name"])
				continue
			category["products"] += orb_category["products"]
			break
	return ..()
//Items Added to Premium
/obj/machinery/vending/wardrobe/cargo_wardrobe
    orb_premium = list(
        /obj/item/toy/plush/felfyplushie = 1,
		/obj/item/toy/plush/ivonaplushie = 1,
    )

/obj/machinery/vending/wardrobe/bar_wardrobe
    orb_premium = list(
        /obj/item/toy/plush/pennyplushie = 1,
    )

/obj/machinery/vending/wardrobe/robo_wardrobe
	orb_premium = list(
		/obj/item/toy/plush/fishplushie = 1
	)

//Items Added to General

//Items Added to Contraband
/obj/machinery/vending/autodrobe
	orb_contraband = list(
		/obj/item/clothing/glasses/salesman = 2,
	)

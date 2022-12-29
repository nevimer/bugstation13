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

/obj/machinery/vending/autodrobe
	orb_premium = list(
		/obj/item/clothing/suit/hooded/wintercoat/cosmic = 1,
	)

/obj/machinery/vending/wardrobe/sec_wardrobe
	orb_products = list(
		/obj/item/clothing/suit/toggle/jacket/sec = 3,
	)

/obj/machinery/vending/wardrobe/medi_wardrobe
	orb_products = list(
		/obj/item/clothing/suit/toggle/jacket/med = 4,
	)

/obj/machinery/vending/wardrobe/engi_wardrobe
	orb_products = list(
		/obj/item/clothing/suit/toggle/jacket/engi = 3,
	)

/obj/machinery/vending/wardrobe/atmos_wardrobe
	orb_products = list(
		/obj/item/clothing/suit/toggle/jacket/engi = 2,
	)

/obj/machinery/vending/wardrobe/cargo_wardrobe
	orb_products = list(
		/obj/item/clothing/suit/toggle/jacket/supply = 2,
	)

/obj/machinery/vending/wardrobe/science_wardrobe
	orb_products = list(
		/obj/item/clothing/suit/toggle/jacket/sci = 2,
	)

/obj/machinery/vending/wardrobe/bar_wardrobe
	orb_products = list(
		/obj/item/clothing/suit/hooded/wintercoat/bartender = 2,
	)

/obj/machinery/vending/clothing
	orb_product_categories = list(
		list(
			"name" = "Suits & Skirts",
			"products" = list(
				/obj/item/clothing/suit/toggle/jacket = 2,
				/obj/item/clothing/suit/toggle/jacket/flannel = 2,
				/obj/item/clothing/suit/toggle/jacket/flannel/red = 2,
				/obj/item/clothing/suit/toggle/jacket/flannel/aqua = 2,
				/obj/item/clothing/suit/toggle/jacket/flannel/brown = 2,
				/obj/item/clothing/suit/hawaiian/blue = 2,
				/obj/item/clothing/suit/hawaiian/orange = 2,
				/obj/item/clothing/suit/hawaiian/purple = 2,
				/obj/item/clothing/suit/hawaiian/green = 2,
			),
		),
	)

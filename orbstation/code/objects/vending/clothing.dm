// Additions to the AutoDrobe and ClothesMate clothing lists. For departmental wardrobes, see dept_wardrobes.dm.

/obj/machinery/vending/autodrobe
	orb_product_categories = list(
		list(
			"name" = "Entertainers",
			"products" = list(
				/obj/item/clothing/under/rank/civilian/clown/jester/alt = 1,
				/obj/item/clothing/head/costume/jester/alt = 1,
			),
		),
	)
	orb_premium = list(
		/obj/item/clothing/suit/hooded/wintercoat/cosmic = 1,
	)
	orb_contraband = list(
		/obj/item/clothing/glasses/salesman = 2,
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
        list(
            "name" = "Accessories",
            "products" = list(
				/obj/item/lipstick = 2,
				/obj/item/lipstick/white =2,
				/obj/item/lipstick/blue =2,
				/obj/item/lipstick/purple = 2,
				/obj/item/lipstick/jade = 2,
				/obj/item/lipstick/green = 2,
				/obj/item/lipstick/black = 2,
        	),
        ),
    )

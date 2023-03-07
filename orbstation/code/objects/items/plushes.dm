/obj/item/toy/plush/felfyplushie
	name = "felfy plushie"
	desc = "a stuffed toy resembling cargo's favorite ratfolk, Able to say Erm in thirteen languages!"
	icon = 'orbstation/icons/obj/items/plushes.dmi'
	icon_state = "felfyplush"
	attack_verb_continuous = list("squeaks", "erms", "blushes")
	attack_verb_simple = list("squeak", "erm", "blush")
	gender = FEMALE

/obj/machinery/vending/wardrobe/cargo_wardrobe
    premium = list(
        /obj/item/clothing/under/rank/cargo/miner = 3,
        /obj/item/clothing/head/costume/mailman = 1,
        /obj/item/clothing/under/misc/mailman = 1,
        /obj/item/toy/plush/felfyplushie = 1,
    )

/obj/item/toy/plush/pennyplushie
	name = "lady penelope dreadful plushie"
	desc = "A cuddly toy depicting the rare and famous catgirl Lady Penelope Dreadful, commissioned during an ill-fated merchandising attempt. It is of exceedingly poor quality, and appears to be full of ground-up fibreglass."
	icon = 'orbstation/icons/obj/items/plushes.dmi'
	icon_state = "pennyplush"
	attack_verb_continuous = list("ohohos", "bites", "treats")
	attack_verb_simple = list("ohoho", "bite", "treat")
	gender = FEMALE

/obj/machinery/vending/wardrobe/bar_wardrobe
		premium = list(
		/obj/item/storage/box/dishdrive = 1,
		/obj/item/toy/plush/pennyplushie = 1,
		)

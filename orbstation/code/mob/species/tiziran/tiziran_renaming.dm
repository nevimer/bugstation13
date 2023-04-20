// A variety of overrides to rename "lizardpeople" in-game.
/obj/item/toy/plush/lizard_plushie
	desc = "An adorable stuffed toy that resembles a tiziran."

/obj/item/toy/plush/lizard_plushie/green
	desc = "An adorable stuffed toy that resembles a green tiziran. This one fills you with nostalgia and soul."

/obj/item/toy/plush/space_lizard_plushie
	desc = "An adorable stuffed toy that resembles a very determined spacefaring tiziran. To infinity and beyond, little guy."

// The original referenced "lizard janitors" which is just a baffling meme. Giving it an unrelated ad instead.
/obj/machinery/vending/wardrobe/jani_wardrobe
	product_ads = "Clean up your act!"

/datum/reagent/mutationtoxin/lizard
	name = "Tiziran Mutation Toxin"

/datum/glass_style/drinking_glass/kortara
	desc = "The fermented nectar of the Korta nut, as enjoyed by tizirans galaxywide."

/datum/glass_style/drinking_glass/protein_blend
	desc = "Even the robust Tiziran digestive system can barely stand this."

//Updating to match the lore as well as the name
/datum/reagent/consumable/ethanol/triumphal_arch
	description = "A drink celebrating the Tiziran Empire and its military victories. Popular mostly among sad old Imperial patriots longing for the so-called 'glory days'."

/obj/item/food/grown/korta_nut/sweet
	desc = "A sweet treat tizirans love to eat."

/datum/holiday/draconic_day/greet()
	return "On this day, tizirankind celebrates their language with literature and other cultural works."

/datum/holiday/atrakor_festival/greet()
	return "On this day, tizirans traditionally celebrate the Festival of Atrakor's Might, where they honour the moon god with lavishly adorned clothing, large portions of food, and a massive celebration into the night."

/datum/holiday/tiziran_unification/greet()
	return "On this day over 400 years ago, tizirans first united under a single banner, ready to face the stars as one unified people. With developments in the last several decades, this holiday has become markedly less popular."

/datum/supply_pack/critter/lizard
	name = "Lizard Crate"
	desc = "Hisss! Containssss a friendly lizard. Not to be confusssed with a tiziran."

// May reflavor the Silverscales more later to fit the lore.
/datum/pirate_gang/silverscales
	threat_content = "This is the %SHIPNAME. The Silver Scales wish for some tribute \
		from you plebeians. %PAYOFF credits should do the trick."

/obj/item/storage/box/tiziran_goods
	desc = "A box containing an assortment of fresh Tiziran goods - perfect for making the foods of the former Empire."

/obj/item/food/meat/steak/plain/human/lizard
	name = "tiziran steak"

/obj/item/food/canned/desert_snails
	desc = "Giant snails from the Tiziran desert, packaged in brine. Shells included. Traditionally eaten raw, but used as an ingredient for many dishes."

/obj/item/food/pizza/flatbread/italic
	desc = "The introduction of human foods to the Tiziran border-worlds led to new advancements in fusion cuisine - the Italic flatbread is now a common sight on the menus of takeout stores on several worlds, and can even be found on Tizira itself."

/obj/item/food/bread/root
	desc = "The tiziran equivalent to bread, made from tubers mixed with ground nuts and seeds. In the Spinward Sector, potatoes make a fine substitute. Noticably denser than regular bread."

/obj/item/food/root_flatbread
	desc = "A plain grilled root flatbread. Can be topped with a variety of foods, tiziran or otherwise."

/obj/item/food/spaghetti/garlic_nizaya
	desc = "A tiziran adaptation of the Italian pasta dish, aglio e olio, made with nizaya pasta. Another example of the growing popularity of fusion cuisine after the fall of the Empire."

/obj/item/food/brain_pate
	desc = "A thick pink puree made from finely chopped poached eyeballs and brains, fried onions, and fat. Strictly speaking, it's supposed to be made with animal organs."

/obj/item/food/lizard_fries
	desc = "One of the many human foods to recently make its way to the tizirans was french fries, which are called poms-franzisks in Draconic. When topped with barbecued meat and sauce, they make a hearty meal."

/obj/item/food/lizard_escargot
	desc = "Another example of recent cultural crossover between tizirans and humans, desert snail escargot is closer to the Roman dish cocleas than the contemporary French escargot. It's a somewhat uncommon street food in the border-worlds."

/obj/item/food/moonfish_caviar
	desc = "A rich paste made from moonfish eggs. Generally the only way most tizirans can get them, and used fairly heavily in coastal cooking."

/obj/item/food/moonfish_eggs
	name = "moonfish eggs"
	desc = "The moonfish lays large, transparent white eggs which are prized in tiziran cooking. Their flavour is similar to caviar, but generally is described as deeper and more complex."

/obj/item/food/headcheese
	desc = "A cured block of headcheese. A tiziran staple."

/obj/structure/sign/poster/contraband/imperial_propaganda
	name = "REMEMBER ZAGOSKELD"
	desc = "An old Tiziran Empire propaganda poster from the Civil War's early conflicts. It takes advantage of a massive attack on the Imperial capital to stir up patriotic sentiment."

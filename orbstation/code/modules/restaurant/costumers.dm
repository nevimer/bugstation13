/datum/customer_data/greaser
	prefix_file = "strings/names/adjectives.txt"
	base_icon = 'orbstation/icons/mob/tourists.dmi'
	base_icon_state = "placeholder"
	clothing_sets = list("placeholder_greaser")

	found_seat_lines = list("Ayyyy!")
	cant_find_seat_lines = list("Uncool man, can't hang without a seat!")
	leave_mad_lines = list("This place was grody anyways!")
	leave_happy_lines = list("You are all hip and hep!")
	wait_for_food_lines = list("A few more minutes and I will floor it.")
	friendly_pull_line = "Careful, my vest is original pleather!"
	first_warning_line = "Knock it off nerd!"
	second_warning_line = "One more time, and I will offer you a knuckle sandwich!"
	self_defense_line = "Get bent! Literally!"
	orderable_objects = list( ///similar to the american one, but simpler
		VENUE_RESTAURANT = list(
			/obj/item/food/burger/plain = 30,
			/obj/item/food/burger/cheese = 30,
			/obj/item/food/burger/superbite = 1,
			/obj/item/food/fries = 10,
			/obj/item/food/cheesyfries = 5,
			/obj/item/food/pie/applepie = 5,
			/obj/item/food/pie/pumpkinpie = 5,
			/datum/custom_order/icecream = 14,
		),
		VENUE_BAR = list(
			/datum/reagent/consumable/ethanol/iced_beer = 6,
			/datum/reagent/consumable/ethanol/snowwhite = 3,
			/datum/reagent/consumable/ethanol/beer = 25,
			/datum/reagent/consumable/nuka_cola = 1
		),
	)

/datum/customer_data/hiker
	prefix_file = "strings/names/adjectives.txt"
	base_icon = 'orbstation/icons/mob/tourists.dmi'
	base_icon_state = "placeholder"
	clothing_sets = list("placeholder_hiker")

	found_seat_lines = list("Finally, breaking camp.")
	cant_find_seat_lines = list("The journey  never ends, so it seems.")
	leave_mad_lines = list("I will forage for some nuts and berries then")
	leave_happy_lines = list("My journey can continue...")
	wait_for_food_lines = list("The journey calls, but I am not ready...")
	friendly_pull_line = "Ah, I have set up camp my friend."
	first_warning_line = "I have fought space bears you know."
	second_warning_line = "Fought multiple bears at the same time, in fact."
	self_defense_line = "And you are definitely weaker than a bear."
	orderable_objects = list( ///nuts, berries, vegetables
		VENUE_RESTAURANT = list(
			/obj/item/food/pacoca = 10,
			/obj/item/food/pizza/vegetable = 3,
			/obj/item/food/pizza/mushroom = 3,
			/obj/item/food/pizza/margherita = 3,
			/obj/item/food/salad/herbsalad = 10,
			/obj/item/food/salad/fruit = 5,
			/obj/item/food/salad/greek_salad = 2,
			/obj/item/food/granola_bar = 2,
		),
		VENUE_BAR = list(
			/datum/reagent/consumable/ethanol/applejack = 20,
			/datum/reagent/consumable/ethanol/barefoot = 3,
			/datum/reagent/consumable/ethanol/aloe = 3,
			/datum/reagent/consumable/tea = 4,
			/datum/reagent/consumable/ethanol/bastion_bourbon = 1,
		),
	)

/datum/customer_data/dairy_scientist
	prefix_file = "strings/names/adjectives.txt"
	base_icon = 'orbstation/icons/mob/tourists.dmi'
	base_icon_state = "placeholder"
	clothing_sets = list("placeholder_dairy_scientist")

	found_seat_lines = list("I hope they have a bit of wendsleydale?", "Its okay I brought my own crackers.", "Could you hurry a bit please? I promised GR0-M1T I won't be long.", "I just love the cheese here.")
	cant_find_seat_lines = list("I'm so tired from standing...", "Oh gosh, my feets ache.", "Excuse me, can I have a chair? I left mine home.")
	leave_mad_lines = list("Oh gosh, I am sorry, I have to leave.", "Huh? What is that? GR0-M1T you need me back at home?", "Ah, look at the time!")
	leave_happy_lines = list("Thank you my friend!", "Golly, back to the lab!", "I must tell GRO-M1T about this place!")
	wait_for_food_lines = list("Excuse me, I have to go collect my robo-dog soon.", "*snores")
	friendly_pull_line = "Oh what is this, ol chap?"
	first_warning_line = "Excuse me!"
	second_warning_line = "I warn you, I haven't tested my new self defense gear yet!"
	self_defense_line = "Oh so that is what that button does!"
	orderable_objects = list( ///dairy
		VENUE_RESTAURANT = list(
			/obj/item/food/cheese/wedge = 40,
			/obj/item/food/cheese/firm_cheese_slice = 15,
			/obj/item/food/cheese/mozzarella = 15,
			/obj/item/food/grilled_cheese_sandwich = 5,
			/obj/item/food/cheesyfries = 5,
			/obj/item/food/herby_cheese = 2,
			/obj/item/food/grilled_cheese = 2,
			/obj/item/food/baked_cheese_platter = 2,
		),
		VENUE_BAR = list(
			/datum/reagent/consumable/milk = 10,
			/datum/reagent/consumable/coffee = 10,
			/datum/reagent/consumable/cherryshake = 1,
			/datum/reagent/consumable/vanillashake = 2,
			/datum/reagent/consumable/caramelshake = 2,
			/datum/reagent/consumable/ethanol/bilk = 2,
		),
	)

/datum/customer_data/gymbro
	prefix_file = "strings/names/adjectives.txt"
	base_icon = 'orbstation/icons/mob/tourists.dmi'
	base_icon_state = "placeholder"
	clothing_sets = list("placeholder_gymbro")

	found_seat_lines = list("Hup! I need my protein, bro!")
	cant_find_seat_lines = list("Looks like I am not skipping leg day today.")
	leave_mad_lines = list("At least I exercized my frowning muscles.")
	leave_happy_lines = list("Thanks, you can be my spotter any time, bro!")
	wait_for_food_lines = list("Hurry up! My personal trainer is very strict!")
	friendly_pull_line = "What gives, bro?"
	first_warning_line = "Very funny, bro."
	second_warning_line = "Slightly less funny, bro!"
	self_defense_line = "Time to show you why I work out!"
	orderable_objects = list( ///meats, legumes, pasta
		VENUE_RESTAURANT = list(
			/obj/item/food/burger/plain = 30,
			/*
			Egg Bowl
			Scotch Egg
			Fried Egg
			Chicken Nugget
			BBQ Rib
			Meatloaf
			Spaghetti & Meatballs
			Beef Noodle
			Beans
			*/
		),
		VENUE_BAR = list(
			/datum/reagent/consumable/ethanol/beer = 25,
			/*
			Beepsky Smash
			Protein blend
			Moscow Mule
			Green Giant Smoothie
			Fernet Cola
			Eggnog
			*/
		),
	)

/datum/customer_data/fireman
	prefix_file = "strings/names/adjectives.txt"
	base_icon = 'orbstation/icons/mob/tourists.dmi'
	base_icon_state = "placeholder"
	clothing_sets = list("placeholder_fireman")

	found_seat_lines = list("Give me your spiciest food. I must become one with fire.")
	cant_find_seat_lines = list("Don't they know this is an emergency?")
	leave_mad_lines = list("This is the only time the lack of fire bothers me.")
	leave_happy_lines = list("The sweet heat! I understand fire now!")
	wait_for_food_lines = list("The temperature is not ticking up...")
	friendly_pull_line = "Huh, is there an actual fire?"
	first_warning_line = "You know we are also trained in breaking down stuff."
	second_warning_line = "You will feel the burn if you continue."
	self_defense_line = "I am going to flatten you like a firetruck!"
	orderable_objects = list( ///spice stuff
		VENUE_RESTAURANT = list(
			/obj/item/food/burger/plain = 30,
			/*
			Cuban Nachos
			fuegoburrito
			Enchiladas
			Fiesta Corn Skillet
			Hot Chili
			Chili Sin Carne
			Chips and Salsa
			Black Eyed Gumbo
			*/
		),
		VENUE_BAR = list(
			/datum/reagent/consumable/ethanol/beer = 25,
			/*
			Sbiten
			Crevice Spike
			Mauna Loa
			Toxins Special
			Demons Blood
			Rum
			*/
		),
	)

/datum/customer_data/sweet_tooth
	prefix_file = "strings/names/adjectives.txt"
	base_icon = 'orbstation/icons/mob/tourists.dmi'
	base_icon_state = "placeholder"
	clothing_sets = list("placeholder_sweet_tooth")

	found_seat_lines = list("Hi hi! I am here for some sweets, sweetie!")
	cant_find_seat_lines = list("Aw. The place is full.")
	leave_mad_lines = list("*cries")
	leave_happy_lines = list("*flip","*spin","*clap")
	wait_for_food_lines = list("Hum hum hum...")
	friendly_pull_line = "Oh? Sorry?"
	first_warning_line = "Hey! This is not sweet of you."
	second_warning_line = "I can be pretty sour too!"
	self_defense_line = "*crack"
	orderable_objects = list( ///pastries and sweet drinks
		VENUE_RESTAURANT = list(
			/obj/item/food/burger/plain = 30,
			/*
			dulce de batata
			Chocolate Cornet
			Cannoli
			Honk-pocket
			Berry Clafoutis
			Banana Cream Pie
			Amanita Pie
			Mothmallows
			Cornuto
			Strawberry ice cream sandwich
			Sundae
			Berry Muffin
			ant candy
			*/
		),
		VENUE_BAR = list(
			/datum/reagent/consumable/ethanol/beer = 25,
			/*
			Alexander
			Godmother
			Amaretto
			Banana Honk
			Banana Milkshake
			Booger
			Cinderella
			Chocolate Pudding
			Gibb Floats
			*/
		),
	)

/datum/customer_data/shift_worker
	prefix_file = "strings/names/adjectives.txt"
	base_icon = 'orbstation/icons/mob/tourists.dmi'
	base_icon_state = "placeholder"
	clothing_sets = list("placeholder_shift_worker")

/datum/customer_data/shift_worker/breakfast
	found_seat_lines = list("Nothing better than starting the day with breakfast!")
	cant_find_seat_lines = list("Please, give me a seat! I am on the clock!")
	leave_mad_lines = list("OH NO I AM LATE!!")
	leave_happy_lines = list("Ready to leave!")
	wait_for_food_lines = list("Um, my boss will be mad.")
	friendly_pull_line = "Hey, I am busy!"
	first_warning_line = "Hey, I just wanted breakfast!"
	second_warning_line = "For robot god's sake, let me eat in peace!"
	self_defense_line = "Never come between a bot and their breakfast."
	orderable_objects = list( ///morning food
		VENUE_RESTAURANT = list(
			/obj/item/food/burger/plain = 30,
			/*
			bacon
			jelliedtoast
			friedegg
			croissant
			donut
			full_english
			frenchtoast
			branrequests
			pancake
			waffles
			*/
		),
	)

/datum/customer_data/shift_worker/after_hours
	found_seat_lines = list("Nothing better than ending the day with a drink!")
	cant_find_seat_lines = list("Please, give me a seat! I am off the clock!")
	leave_mad_lines = list("Sorry, but I need my beauty sleep.")
	leave_happy_lines = list("The nightcap that I needed!")
	wait_for_food_lines = list("Um, my cat will be mad.")
	friendly_pull_line = "Hey, I am not on overtime!"
	first_warning_line = "Hey, I just wanted a nightcap!"
	second_warning_line = "For robot god's sake, let me drink in peace!"
	self_defense_line = "Never come before a bot and their drink."
	orderable_objects = list( ///vacation drinks
		VENUE_BAR = list(
			/datum/reagent/consumable/ethanol/beer = 25,
			/*
			Between the Sheets
			Italian Hot Chocolate
			Ginger Amaretto
			Pan-Galactic Gargle Blaster
			Pina Colada
			Gin
			*/
		),
	)

/datum/customer_data/shore_leave_moth
	prefix_file = "strings/names/adjectives.txt"
	base_icon = 'orbstation/icons/mob/tourists.dmi'
	base_icon_state = "placeholder"
	clothing_sets = list("placeholder_shore_leave_moth")

	found_seat_lines = list("What do you have for a hungry fueljack?")
	cant_find_seat_lines = list("Permission to land, sir!")
	leave_mad_lines = list("You are lucky I am no longer in the pirate corps...")
	leave_happy_lines = list("A taste of home, away from home...")
	wait_for_food_lines = list("Light, give me strength.")
	friendly_pull_line = "*swear"
	first_warning_line = "Unhand me, civilian!"
	second_warning_line = "More unpleasant than raw töchtaüse!"
	self_defense_line = "*aflap"
	orderable_objects = list( ///moffic food and drinks
		VENUE_RESTAURANT = list(
			/obj/item/food/burger/plain = 30,
		),
		VENUE_BAR = list(
			/datum/reagent/consumable/ethanol/beer = 25,
		),
	)

/datum/customer_data/praetorian_tiziran
	prefix_file = "strings/names/adjectives.txt"
	base_icon = 'orbstation/icons/mob/tourists.dmi'
	base_icon_state = "placeholder"
	clothing_sets = list("placeholder_praetorian_tiziran")

	found_seat_lines = list("By the power of the Empress, I require sustenance!")
	cant_find_seat_lines = list("The legion can not wait!")
	leave_mad_lines = list("Well. The Empress is more important than food!")
	leave_happy_lines = list("You served sustenance so I can serve Robo-Tizira!")
	wait_for_food_lines = list("The truce expires soon.")
	friendly_pull_line = "My duty is with sustenance!"
	first_warning_line = "You dare challenge me?"
	second_warning_line = "You dare challenge me twice?"
	self_defense_line = "May Atrakor smile on the victor!"
	orderable_objects = list( ///tiziran food and drinks
		VENUE_RESTAURANT = list(
			/obj/item/food/burger/plain = 30,
		),
		VENUE_BAR = list(
			/datum/reagent/consumable/ethanol/beer = 25,
		),
	)

/datum/customer_data/space_whaler
	prefix_file = "strings/names/adjectives.txt"
	base_icon = 'orbstation/icons/mob/tourists.dmi'
	base_icon_state = "placeholder"
	clothing_sets = list("placeholder_space_whaler")

	found_seat_lines = list("Avast! Fulfill me order, and there be coin for ye!")
	cant_find_seat_lines = list("What shall we do with the impatient sailor...")
	leave_mad_lines = list("Ye be in league with the space carp!")
	leave_happy_lines = list("With this, I have the strength to kill that purple whale...")
	wait_for_food_lines = list("I be sailing out soon, so ye better hurry!")
	friendly_pull_line = "What in the name of Space Ishmael!"
	first_warning_line = "I lost many limbs while fighting carps."
	second_warning_line = "They been replaced by stronger limbs!"
	self_defense_line = "I will keelhaul ye!"
	orderable_objects = list( ///fish, rice, anti-scurvy
		VENUE_RESTAURANT = list(
			/obj/item/food/burger/plain = 30,
		),
		VENUE_BAR = list(
			/datum/reagent/consumable/ethanol/beer = 25,
		),
	)

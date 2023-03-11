/*
greaser (generic burgers to make them easy) = 50
hiker (nuts and vegetables, there are many of those) = 30
dairy_scientist (cheeeeese) = 30
fireman (needs those spicy meaty foods) = 30
gymbro (needs protein, mainly meats and beans) = 30
sweet tooth (pastries are nice!) = 20
breakfast in restaurant, shift end in bar (separate because of flavour) = 20
shore leave traveler moth (moffic food) = 10
praetorian tiziran (needs korta) = 10
fisherman (fish are harder to get, but might ask for rice mainly) = 5
moth -> kept (funny rare moth) = 1
malfunction -> kept (funny rare bot) = 1
*/

/datum/venue/restaurant
	name = "restaurant"
	customer_types = list(
		/datum/customer_data/greaser = 50,
		/datum/customer_data/hiker = 30,
		/datum/customer_data/dairy_scientist = 30,
		/datum/customer_data/gymbro = 30,
		/datum/customer_data/fireman = 30,
		/datum/customer_data/sweet_tooth = 20,
		/datum/customer_data/shift_worker/breakfast = 20,
		/datum/customer_data/shore_leave_moth = 10,
		/datum/customer_data/praetorian_tiziran = 10,
		/datum/customer_data/space_whaler = 10,
		/datum/customer_data/moth = 1,
		/datum/customer_data/malfunction = 1,
	)

/datum/venue/bar
	customer_types = list(
		/datum/customer_data/greaser = 50,
		/datum/customer_data/hiker = 30,
		/datum/customer_data/dairy_scientist = 30,
		/datum/customer_data/gymbro = 30,
		/datum/customer_data/fireman = 30,
		/datum/customer_data/sweet_tooth = 20,
		/datum/customer_data/shift_worker/after_hours = 20,
		/datum/customer_data/shore_leave_moth = 10,
		/datum/customer_data/praetorian_tiziran = 10,
		/datum/customer_data/space_whaler = 10,
		/datum/customer_data/malfunction = 1,
	)

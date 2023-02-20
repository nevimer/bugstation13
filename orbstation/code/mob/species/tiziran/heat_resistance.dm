/datum/species/lizard
	coldmod = 1 //no more increased cold damage
	heatmod = 1 //no more heat resistance either, sorry
	bodytemp_heat_damage_limit = BODYTEMP_HEAT_DAMAGE_LIMIT
	bodytemp_cold_damage_limit = BODYTEMP_COLD_DAMAGE_LIMIT

/datum/species/lizard/create_pref_temperature_perks()
	return list()

/datum/species/lizard/ashwalker
	heatmod = 0.5
	bodytemp_heat_damage_limit = (BODYTEMP_HEAT_DAMAGE_LIMIT + 50)
	bodytemp_cold_damage_limit = (BODYTEMP_COLD_DAMAGE_LIMIT - 10)

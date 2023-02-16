/datum/species/lizard
	species_traits = list(
		MUTCOLORS,
		EYECOLOR,
		LIPS,
		HAIR
	)
	coldmod = 1 //no more increased cold damage
	heatmod = 1 //no more heat resistance either, sorry
	bodytemp_heat_damage_limit = BODYTEMP_HEAT_DAMAGE_LIMIT
	bodytemp_cold_damage_limit = BODYTEMP_COLD_DAMAGE_LIMIT

/datum/species/lizard/randomize_features(mob/living/carbon/human/human_mob)
	..()
	human_mob.hairstyle = "Bald"
	human_mob.facial_hair_color = "#F0E0C0" // for the colored snout option

/datum/species/lizard/create_pref_temperature_perks()
	return list()

/datum/species/lizard/ashwalker
	heatmod = 0.5
	bodytemp_heat_damage_limit = (BODYTEMP_HEAT_DAMAGE_LIMIT + 50)
	bodytemp_cold_damage_limit = (BODYTEMP_COLD_DAMAGE_LIMIT - 10)

/datum/species/lizard/silverscale
	/// Stored facial hair color for when the species is removed.
	var/old_facehair_color

/datum/species/lizard/silverscale/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	var/mob/living/carbon/human/new_silverscale = C
	old_facehair_color = new_silverscale.facial_hair_color
	new_silverscale.facial_hair_color = "#FFFFFF"

/datum/species/lizard/silverscale/on_species_loss(mob/living/carbon/C)
	..()
	var/mob/living/carbon/human/was_silverscale = C
	was_silverscale.facial_hair_color = old_facehair_color

//Orb specific sprite accessories
/datum/sprite_accessory/body_markings/ltigercolor
	name = "Light Tiger Body (Colored)"
	icon_state = "ltiger"
	gender_specific = 1
	color_src = FACEHAIR

/datum/sprite_accessory/body_markings/dtigercolor
	name = "Dark Tiger Body (Colored)"
	icon_state = "dtiger"
	gender_specific = 1
	color_src = FACEHAIR

/datum/sprite_accessory/body_markings/lbellycolor
	name = "Light Belly (Colored)"
	icon_state = "lbelly"
	gender_specific = 1
	color_src = FACEHAIR

/datum/sprite_accessory/snouts/sharpcolored
	name = "Sharp + Colored"
	icon_state = "sharplight"
	color_src = FACEHAIR

/datum/sprite_accessory/snouts/roundcolored
	name = "Round + Colored"
	icon_state = "roundlight"
	color_src = FACEHAIR

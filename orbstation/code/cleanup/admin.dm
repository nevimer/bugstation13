/// Removing a fatphobic smite... Replaces it with one that completely empties them of nutrition.
/datum/smite/fat
	name = "Make hungry"

/datum/smite/fat/effect(client/user, mob/living/target)
	. = ..()
	target.set_nutrition(0)

// We want jellypeople to be able to be dismembered
#define WAS_DISMEMBERED "dismembered" // Orb code interception to allow jelly dismemberment

/obj/item/bodypart/apply_qualified_wounds(wounding_type, wounding_dmg, wound_bonus, bare_wound_bonus, attack_direction, sharpness)
	. = ..()
	if (!owner || . == WAS_DISMEMBERED)
		return
	if (biological_state != BIO_SLIME) // Everything else is handled in super
		return // We can turn this into a switch if we ever expand it
	if (wound_bonus == CANT_WOUND)
		return // Don't dismember on woundless damage
	// If we're easy to dismember we don't reduce wounding damage from varying type
	if (!HAS_TRAIT(owner, TRAIT_EASYDISMEMBER))
		if (wounding_type == WOUND_SLASH)
			wounding_dmg *= 0.8 // With no need to wound first this is necessary to stop saws obliterating them
		else
			wounding_dmg *= 0.6 // Otherwise slimes are most easily slashed apart
	if (wounding_type != WOUND_BURN)
		wounding_type = WOUND_PIERCE // Most appropriate message

	if (!try_dismember(wounding_type, wounding_dmg, wound_bonus, bare_wound_bonus))
		return
	return WAS_DISMEMBERED

#undef WAS_DISMEMBERED

/obj/item/bodypart/head/jelly
	biological_state = BIO_SLIME

/obj/item/bodypart/chest/jelly
	biological_state = BIO_SLIME

/obj/item/bodypart/arm/left/jelly
	biological_state = BIO_SLIME

/obj/item/bodypart/arm/right/jelly
	biological_state = BIO_SLIME

/obj/item/bodypart/leg/left/jelly
	biological_state = BIO_SLIME

/obj/item/bodypart/leg/right/jelly
	biological_state = BIO_SLIME

/obj/item/bodypart/head/slime
	biological_state = BIO_SLIME

/obj/item/bodypart/chest/slime
	biological_state = BIO_SLIME

/obj/item/bodypart/arm/left/slime
	biological_state = BIO_SLIME

/obj/item/bodypart/arm/right/slime
	biological_state = BIO_SLIME

/obj/item/bodypart/leg/left/slime
	biological_state = BIO_SLIME

/obj/item/bodypart/leg/right/slime
	biological_state = BIO_SLIME

/obj/item/bodypart/head/luminescent
	biological_state = BIO_SLIME

/obj/item/bodypart/chest/luminescent
	biological_state = BIO_SLIME

/obj/item/bodypart/arm/left/luminescent
	biological_state = BIO_SLIME

/obj/item/bodypart/arm/right/luminescent
	biological_state = BIO_SLIME

/obj/item/bodypart/leg/left/luminescent
	biological_state = BIO_SLIME

/obj/item/bodypart/leg/right/luminescent
	biological_state = BIO_SLIME

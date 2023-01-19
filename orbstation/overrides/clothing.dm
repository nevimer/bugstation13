// Anything that modifies existing clothing.

//Makes the alternate jester cap hide hair and ears.
/obj/item/clothing/head/costume/jester/alt
	flags_inv = HIDEEARS|HIDEHAIR


/obj/item/clothing/glasses/regular
	clothing_traits = list(TRAIT_NEARSIGHTED_CORRECTED, TRAIT_FARSIGHTED_CORRECTED)

/obj/item/clothing/glasses/regular/atom_destruction(damage_flag)
	. = ..()
	clothing_traits -= TRAIT_FARSIGHTED_CORRECTED

/obj/item/clothing/glasses/regular/repair()
	. = ..()
	clothing_traits |= TRAIT_FARSIGHTED_CORRECTED

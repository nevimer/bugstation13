/datum/species/human/felinid
	disliked_food = GROSS | CLOTH | CUCUMBER
	liked_food = SEAFOOD | ORANGES | BUGS | GORE
	payday_modifier = 1.0

/datum/species/human/felinid/get_scream_sound(mob/living/carbon/human/human)
	return pick(
		'orbstation/sound/voice/felinid/scream1.ogg',
		'orbstation/sound/voice/felinid/scream2.ogg',
	)

/datum/sprite_accessory/ears/cat/big
	name = "Big"
	icon = 'orbstation/icons/mob/species/felind/bodyparts.dmi'
	icon_state = "big"

/datum/sprite_accessory/ears/cat/miqo
	name = "Coeurl"
	icon = 'orbstation/icons/mob/species/felind/bodyparts.dmi'
	icon_state = "miqo"

/datum/sprite_accessory/ears/cat/fold
	name = "Fold"
	icon = 'orbstation/icons/mob/species/felind/bodyparts.dmi'
	icon_state = "fold"

/datum/sprite_accessory/ears/cat/lynx
	name = "Lynx"
	icon = 'orbstation/icons/mob/species/felind/bodyparts.dmi'
	icon_state = "lynx"

/datum/sprite_accessory/ears/cat/round
	name = "Round"
	icon = 'orbstation/icons/mob/species/felind/bodyparts.dmi'
	icon_state = "round"

/datum/sprite_accessory/tails/human/cat/short
	name = "Short Cat"
	icon = 'orbstation/icons/mob/species/felind/bodyparts.dmi'
	icon_state = "cat_short"

/datum/sprite_accessory/tails/human/cat/fluffy
	name = "Fluffy Cat"
	icon = 'orbstation/icons/mob/species/felind/bodyparts.dmi'
	icon_state = "cat_fluffy"

/datum/supply_pack/goody/felinid_encryption_key
	desc = "A hi-tech radio encryption key that allows the wearer to understand felimimetic when the radio is worn."

/obj/item/encryptionkey/felinid
	desc = "An encryption key that automatically encodes felimimetic heard through the radio into common. The signal's rather scratchy."

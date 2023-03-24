// Parent type for "crew member" plushies.
/obj/item/toy/plush/crew
	name = "crew plush"
	desc = "A peculiar plush supposedly depicting a member of Orbstation's crew. How did you get this?"
	icon = 'orbstation/icons/obj/items/plushes.dmi'

// Breeding your co-workers is against server rules.
/obj/item/toy/plush/crew/plop(obj/item/toy/plush/Daddy)
	return FALSE

/obj/item/toy/plush/crew/felfyplushie
	name = "\improper Felfy plushie"
	desc = "A stuffed toy resembling cargo's favorite ratfolk, Able to say Erm in thirteen languages!"
	icon_state = "felfyplush"
	attack_verb_continuous = list("squeaks", "erms", "blushes")
	attack_verb_simple = list("squeak", "erm", "blush")
	gender = FEMALE

/obj/item/toy/plush/crew/pennyplushie
	name = "\improper Lady Penelope Dreadful plushie"
	desc = "A cuddly toy depicting the rare and famous catgirl Lady Penelope Dreadful, commissioned during an ill-fated merchandising attempt. It is of exceedingly poor quality, and appears to be full of ground-up fibreglass."
	icon_state = "pennyplush"
	attack_verb_continuous = list("ohohos", "bites", "treats")
	attack_verb_simple = list("ohoho", "bite", "treat")
	gender = FEMALE

/obj/item/toy/plush/crew/fishplushie
	name = "\improper Fish plushie"
	desc = "A fuzzy toy of Research's most scrungled roboticist, Fish. Matching Chip plushie coming soon!"
	icon_state = "fishplush"
	attack_verb_continuous = list("bites", "squeaks", "spins")
	attack_verb_simple = list("bite", "squeak", "spin")
	squeak_override = list('sound/weapons/laser.ogg' = 1)
	gender = FEMALE

/obj/item/toy/plush/crew/ivonaplushie
	name = "\improper Ivona plushie"
	desc = "A plushed toy of mining's largest reptile, Ivona. Somehow smells just like the ash and brimstone of Lavaland."
	icon_state = "ivonaplush"
	attack_verb_continuous = list("growls", "chomps", "slashes")
	attack_verb_simple = list("growl", "chomp", "slash")
	squeak_override = list('sound/weapons/kenetic_accel.ogg' = 1)
	gender = FEMALE

/obj/item/toy/plush/amoungplushie
	name = "amoung plushie"
	desc = "A cuddly toy depicting the dangerous and rare alien species, the Amoung. Seems kinda sus."
	icon = 'orbstation/icons/obj/items/plushes.dmi'
	icon_state = "amoungplush"
	attack_verb_continuous = list("suses", "stabs", "ejects")
	attack_verb_simple = list("sus", "stab", "eject")
	squeak_override = list('sound/creatures/alien_organ_cut.ogg' = 1)

/obj/item/toy/plush/tbhplushie
	name = "tbh plushie"
	desc = "A cuddly critter plushie. Its wide-eyed stare gives you a warm fuzzy feeling."
	icon = 'orbstation/icons/obj/items/plushes.dmi'
	icon_state = "tbhplush"
	attack_verb_continuous = list("yippees", "stares", "paws")
	attack_verb_simple = list("yippee", "stare", "paw")
	squeak_override = list('orbstation/sound/tbh_yippee.ogg' = 1)

/obj/item/toy/plush/milkinz
	name = "milkinz"
	desc = "A milk-soaked cat plushie. Its sad eyes bore into you despite its crusty exterior."
	icon = 'orbstation/icons/obj/items/plushes.dmi'
	icon_state = "milkinz"
	force = 5
	throwforce = 5
	attack_verb_continuous = list("squelches", "slaps", "slops")
	attack_verb_simple = list("squelch", "slap", "slop")
	squeak_override = list('sound/misc/splort.ogg' = 1)

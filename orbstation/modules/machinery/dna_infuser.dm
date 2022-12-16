/// lets be honest we're going to go ga-ga for this thing

/// adds to upstream branches organ set bonus to give ratfolk organs if you get the other rat organs
/datum/status_effect/organ_set_bonus/rat/enable_bonus()
	. = ..()
	var/mob/living/carbon/human/human = owner
	if(!istype(human))
		return

	if(isratfolk(human))
		return

	var/obj/item/organ/external/tail/ratfolk/mouseytail = new()
	var/obj/item/organ/internal/ears/ratfolk/mouseyear = new()

	mouseytail.Insert(human, special = FALSE, drop_if_replaced = TRUE)
	mouseyear.Insert(human, special = FALSE, drop_if_replaced = TRUE)



/// same but removes external organs,
/datum/status_effect/organ_set_bonus/rat/disable_bonus()
	. = ..()
	var/mob/living/carbon/human/human = owner
	if(!istype(human))
		return
	if(isratfolk(human))
		return

	var/obj/item/organ/internal/ears/ratfolk/mouseyear = human.getorganslot(ORGAN_SLOT_EARS)
	var/obj/item/organ/external/tail/ratfolk/mouseytail = human.getorganslot(ORGAN_SLOT_EXTERNAL_TAIL)

	mouseytail.Remove(human, special = FALSE,)
	mouseyear.Remove(human, special = FALSE,)


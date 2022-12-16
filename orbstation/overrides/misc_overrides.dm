// Disables the "suicide" client verb entirely.
/mob/living/carbon/human/suicide()
	return

// Disables shooting yourself in the mouth with a gun
/obj/item/gun/handle_suicide(mob/living/carbon/human/user, mob/living/carbon/human/target, params, bypass_timer)
	if(user == target)
		return
	return ..()

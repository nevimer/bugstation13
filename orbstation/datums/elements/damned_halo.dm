/**
 * # Damned halo element
 *
 * Applies and removes the halo used by the "Damned" quirk.
 * This differs from the cult halo in that it uses a different icon,
 * and can be removed through changeling transformation.
 * It can also be hidden or revealed via an action button.
 *
 */

/datum/element/damned_halo

/datum/element/damned_halo/Attach(datum/target)
	. = ..()
	if (!isliving(target))
		return ELEMENT_INCOMPATIBLE

	// Retains the halo when turning into a monkey or back again
	RegisterSignals(target, list(COMSIG_MONKEY_HUMANIZE, COMSIG_HUMAN_MONKEYIZE), PROC_REF(reveal_halo))
	ADD_TRAIT(target, TRAIT_DAMNED_HALO, QUIRK_TRAIT)
	reveal_halo(target)

/datum/element/damned_halo/Detach(mob/living/target, ...)
	REMOVE_TRAIT(target, TRAIT_DAMNED_HALO, QUIRK_TRAIT)
	hide_halo(target)
	UnregisterSignal(target, list(COMSIG_HUMAN_MONKEYIZE, COMSIG_MONKEY_HUMANIZE))
	return ..()

/// Adds the halo overlay to the mob.
/datum/element/damned_halo/proc/reveal_halo(mob/living/target)
	SIGNAL_HANDLER
	var/mutable_appearance/new_halo_overlay = mutable_appearance('orbstation/icons/effects/damned_halo.dmi', "halo", -HALO_LAYER)
	if (ishuman(target))
		var/mob/living/carbon/human/human_parent = target
		new /obj/effect/temp_visual/cult/sparks(get_turf(human_parent), human_parent.dir)
		human_parent.overlays_standing[HALO_LAYER] = new_halo_overlay
		human_parent.apply_overlay(HALO_LAYER)
	else
		target.add_overlay(new_halo_overlay)

/// Removes the halo overlay from the mob.
/datum/element/damned_halo/proc/hide_halo(mob/living/target)
	if (ishuman(target))
		var/mob/living/carbon/human/human_parent = target
		human_parent.remove_overlay(HALO_LAYER)
		human_parent.update_body()
	else
		target.cut_overlay(HALO_LAYER)

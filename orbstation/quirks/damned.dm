/datum/quirk/damned
	name = "Damned"
	desc = "You have angered the gods! You will be set ablaze upon entering the chapel, and other \
	holy things such as holy books, holy water, and the null rod will have adverse effects against \
	you. You are also marked with an unholy halo, which you can hide at will, although this will hurt."
	icon = "cloud-bolt"
	mob_trait = TRAIT_DAMNED
	value = -4
	gain_text = span_danger("The gods are angry with you!")
	lose_text = span_notice("The gods have forgiven you.")
	medical_record_text = "Patient seems unusually wary around holy people and holy artifacts."
	quirk_flags = QUIRK_HUMAN_ONLY|QUIRK_PROCESSES
	var/datum/action/hide_halo/linked_action
	mail_goodies = list(/obj/item/instrument/violin/golden)

/datum/quirk/damned/add_unique(client/client_source)
	if(!HAS_TRAIT(quirk_holder, TRAIT_UNNATURAL_RED_GLOWY_EYES))
		quirk_holder.AddElement(/datum/element/cult_eyes, initial_delay = 0 SECONDS)
	if(!HAS_TRAIT(quirk_holder, TRAIT_DAMNED_HALO))
		quirk_holder.AddElement(/datum/element/damned_halo)
	linked_action = new(src)
	linked_action.Grant(quirk_holder)

/datum/quirk/damned/remove()
	if(HAS_TRAIT(quirk_holder, TRAIT_UNNATURAL_RED_GLOWY_EYES))
		quirk_holder.RemoveElement(/datum/element/cult_eyes)
	if(HAS_TRAIT(quirk_holder, TRAIT_DAMNED_HALO))
		quirk_holder.RemoveElement(/datum/element/damned_halo)
	QDEL_NULL(linked_action)

/datum/quirk/damned/process(delta_time)
	var/mob/living/carbon/human/human_target = quirk_holder
	if(human_target.stat == DEAD || human_target.dna.species.id == SPECIES_VAMPIRE)
		// Vampires already have the burning effect except stronger, so we don't want to duplicate that here.
		return
	var/area/holder_area = get_area(human_target)
	if(istype(holder_area, /area/station/service/chapel))
		to_chat(human_target, span_warning("The gods reject your presence!"))
		human_target.adjustFireLoss(2 * delta_time)
		human_target.adjust_fire_stacks(3 * delta_time)
		human_target.ignite_mob()

// Action to hide or reveal the damned halo.
// I stole most of this from Jac's external organ concealment code lol

/datum/action/hide_halo
	name = "Conceal unholy halo"
	check_flags = AB_CHECK_HANDS_BLOCKED|AB_CHECK_IMMOBILE|AB_CHECK_CONSCIOUS
	button_icon = 'orbstation/icons/effects/damned_halo_action.dmi'
	button_icon_state = "no_halo"
	/// Spam prevention.
	var/in_use = FALSE

/datum/action/hide_halo/Trigger(trigger_flags)
	. = ..()
	if(!.)
		return
	if(in_use)
		return
	in_use = TRUE
	if (!do_after(owner, 5 SECONDS))
		owner.balloon_alert(owner, "interrupted!")
		in_use = FALSE
		return
	in_use = FALSE
	toggle_concealement()
	playsound(owner, SFX_SPARKS, 50, TRUE, -5)
	update_display()

/datum/action/hide_halo/proc/toggle_concealement()
	if(HAS_TRAIT(owner, TRAIT_DAMNED_HALO))
		owner.RemoveElement(/datum/element/damned_halo)
		if(ishuman(owner))
			var/mob/living/carbon/human/human_owner = owner
			human_owner.adjustFireLoss(10) // that's what you get for hiding from your punishment
	else
		owner.AddElement(/datum/element/damned_halo)

/// Updates the current name, icon, and description
/datum/action/hide_halo/proc/update_display()
	if(!HAS_TRAIT(owner, TRAIT_DAMNED_HALO))
		button_icon_state = "show_halo"
		name = "Reveal unholy halo"
		desc = "Makes your unholy halo visible once more, allowing everyone to know that you are cursed by the gods."
	else
		button_icon_state = "no_halo"
		name = "Conceal unholy halo"
		desc = "Channel your energy to conceal your unholy halo. Be warned: this will burn you."
	build_all_button_icons()

// "Holy weapon" element. Gives the attached item a chance to strike a victim with lightning if they have the "Damned" trait.

#define DEFAULT_LIGHTNING_MESSAGE span_danger("%VICTIM is struck down by a bolt of holy lightning!")

/datum/element/holy_weapon
	element_flags = ELEMENT_BESPOKE
	argument_hash_start_idx = 2
	/// Chance of the target being struck by lightning if they have the "Damned" trait.
	var/lightning_chance
	/// Multiplier for the burn damage done by the lightning strike, as defined by LIGHTNING_BOLT_DAMAGE (75). Defaults to 10%, or 7.5 damage.
	var/lightning_damage_multiplier
	/// Message displayed to viewers when the lightning strike procs.
	var/lightning_message

/datum/element/holy_weapon/Attach(datum/target, lightning_chance = 50, lightning_damage_multiplier = 0.10, lightning_message = DEFAULT_LIGHTNING_MESSAGE)
	. = ..()
	if(!isitem(target))
		return ELEMENT_INCOMPATIBLE
	src.lightning_chance = lightning_chance
	src.lightning_damage_multiplier = lightning_damage_multiplier
	src.lightning_message = lightning_message
	RegisterSignal(target, COMSIG_ITEM_ATTACK, PROC_REF(on_attack))

/datum/element/holy_weapon/Detach(datum/target)
	. = ..()
	UnregisterSignal(target, list(COMSIG_ITEM_ATTACK))

/datum/element/holy_weapon/proc/on_attack(datum/target, mob/living/victim, mob/living/attacker)
	SIGNAL_HANDLER

	if(!HAS_TRAIT(victim, TRAIT_DAMNED) || !prob(lightning_chance) || victim.stat == DEAD)
		return

	lightningbolt(victim, lightning_damage_multiplier)
	var/built_lightning_message = replacetext(lightning_message, "%VICTIM", victim)
	victim.visible_message(built_lightning_message)

#undef DEFAULT_LIGHTNING_MESSAGE

/obj/item/nullrod/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/holy_weapon)

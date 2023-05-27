// Clarifying what this quirk actually is
/datum/quirk/item_quirk/chronic_illness
	desc = "You have Causality Degradation Syndrome - a chronic illness that will slowly remove you from reality, and requires constant medication from Cargo to keep under control."

// Reflavoring the disease slightly
/datum/disease/chronic_illness
	name = "Causality Degradation Syndrome"
	desc = "A disease discovered by Interdyne Pharmaceuticals, in which the body's cells gradually destabilize from the flow of time. Invariably fatal, but can be managed with experimental medication."

/datum/supply_pack/medical/experimentalmedicine
	desc = "A crate containing the medication required for living with Causality Degradation Syndrome, Sansufentanyl."

/obj/item/storage/pill_bottle/sansufentanyl
	desc = "A bottle of pills developed by Interdyne Pharmaceuticals. They're used to treat Causality Degradation Syndrome."

/obj/item/reagent_containers/pill/sansufentanyl
	desc = "Used to treat Causality Degradation Syndrome. Temporary side effects include - nausea, dizziness, impaired motor coordination."

// Removing the traitor objective related
/datum/traitor_objective/target_player/infect
	progression_maximum = 0 MINUTES //cannot be rolled, ever

// If the injector is somehow acquired, it will not infect the target with HMS.
/obj/item/reagent_containers/hypospray/medipen/manifoldinjector/attack(mob/living/affected_mob, mob/living/carbon/human/user)
	inject(affected_mob, user)

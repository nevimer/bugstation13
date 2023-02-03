/datum/quirk/bioscrambler_victim
	name = "Bioscrambler Victim"
	desc = "In the past, a run-in with a bioscrambler anomaly left your body irrevocably scrambled. All your limbs are those of a different species!"
	icon = "dna"
	value = 0
	medical_record_text = "A bioscrambler accident has left the patient's body parts scrambled."

	var/list/species_whitelist = list(
		/datum/species/lizard,
		/datum/species/ethereal,
		/datum/species/moth,
		/datum/species/abductor,
		/datum/species/fly,
		/datum/species/jelly,
		/datum/species/jelly/slime,
		/datum/species/pod,
		/datum/species/ratfolk,
		/datum/species/shadow,
	)

/datum/quirk/bioscrambler_victim/add_unique(client/client_source)
	add_bodypart(BODY_ZONE_L_ARM)
	add_bodypart(BODY_ZONE_R_ARM)
	add_bodypart(BODY_ZONE_L_LEG)
	add_bodypart(BODY_ZONE_R_LEG)

/datum/quirk/bioscrambler_victim/proc/add_bodypart(slot)
	var/mob/living/carbon/human/human_holder = quirk_holder
	var/obj/item/bodypart/prosthetic

	var/list/bodypart_list = fill_bodypart_list(slot)

	if(!bodypart_list.len)
		stack_trace("Bodypart list for bioscrambler victim is empty!")
		return

	var/limbtype = pick(bodypart_list)
	prosthetic = new limbtype()
	prosthetic.species_color = sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]") //make it a random color
	human_holder.del_and_replace_bodypart(prosthetic)

/datum/quirk/bioscrambler_victim/proc/fill_bodypart_list(slot)
	var/list/bodypart_list = list()
	var/mob/living/carbon/human/human_holder = quirk_holder

	for(var/datum/species/part_species as anything in species_whitelist)
		if(human_holder.dna?.species == part_species) //don't use parts from your selected species!
			continue
		var/datum/species/this_species = new part_species()
		if(this_species.bodypart_overrides[slot])
			bodypart_list += this_species.bodypart_overrides[slot]

	return bodypart_list

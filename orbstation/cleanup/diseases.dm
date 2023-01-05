/datum/symptom/beard/
	naturally_occuring = FALSE // disables this symptom from ever appearing

// override the activation, just in case
/datum/symptom/beard/Activate(datum/disease/advance/disease)
	return

// Replacement for beard symptom.
// Identical statistically, but gives you red eyes instead of a beard
/datum/symptom/red_eyes/
	name = "Ocular Sanguinization"
	desc = "The virus produces a unique pigment in the eyes, causing a sinister red glow."
	stealth = 0
	resistance = 3
	stage_speed = 2
	transmittable = 1
	level = 4
	severity = 1
	symptom_delay_min = 18
	symptom_delay_max = 36

	var/color = "#cc0000"

/datum/symptom/red_eyes/Activate(datum/disease/advance/disease)
	. = ..()
	if(!.)
		return
	var/mob/living/target = disease.affected_mob
	if(ishuman(target))
		var/mob/living/carbon/human/H = target

		if (H.eye_color_left != color || H.eye_color_right != color)
			to_chat(H, span_warning("Your eyes briefly ache."))
			H.eye_color_left = color
			H.eye_color_right = color
			H.update_body()



///Wrapper for getting the proper image, colored and everything
/datum/bodypart_overlay/get_overlay(layer, obj/item/bodypart/limb)
	. = ..()
	var/mutable_appearance/inner = get_inner(bitflag_to_layer(layer), limb)
	if (inner)
		. += inner

/datum/bodypart_overlay/proc/get_inner(layer, obj/item/bodypart/limb)
	return

/datum/bodypart_overlay/mutant/get_inner(layer, obj/item/bodypart/limb)
	if (!sprite_datum?.hasinner)
		return

	var/gender = (limb?.limb_gender == FEMALE) ? "f" : "m"
	var/list/icon_state_builder = list()
	icon_state_builder += sprite_datum.gender_specific ? gender : "m" //Male is default because sprite accessories are so ancient they predate the concept of not hardcoding gender
	icon_state_builder += feature_key + "inner"
	icon_state_builder += get_base_icon_state()
	icon_state_builder += mutant_bodyparts_layertext(layer)

	var/finished_icon_state = icon_state_builder.Join("_")

	var/mutable_appearance/appearance = mutable_appearance(sprite_datum.icon, finished_icon_state, layer = -layer)
	colour_inner(appearance, limb)

	if(sprite_datum.center)
		center_image(appearance, sprite_datum.dimension_x, sprite_datum.dimension_y)

	return appearance

/datum/bodypart_overlay/mutant/proc/colour_inner(mutable_appearance/appearance, obj/item/bodypart/limb)
	var/mob/living/carbon/human/owner = limb.owner
	if (sprite_datum.inner_color_src)
		switch(color_source)
			if(ORGAN_COLOR_OVERRIDE)
				appearance.color = override_color(limb.draw_color)
			if(ORGAN_COLOR_INHERIT)
				appearance.color = limb.draw_color
			if(ORGAN_COLOR_HAIR)
				appearance.color = owner.hair_color
	else
		appearance.color = sprite_datum.color_src ? draw_color : null

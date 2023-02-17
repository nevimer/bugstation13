/// Element which just makes it easy to add and remove an animated rays filter
/datum/element/god_rays

/datum/element/god_rays/Attach(datum/target, size = 32, color = COLOR_WHITE, amount = 12, xoffset = 0, yoffset = 0, loop_time = 1 MINUTES)
	. = ..()
	target.add_filter(name = "element_rays", priority = 1, params = list(
			type = "rays",
			size = size,
			color = color,
			density = amount
		))
	animate(target.get_filter("element_rays"), offset = 10, time = loop_time / 2, loop = -1)
	animate(offset = 0, time = loop_time / 2)

/datum/element/god_rays/Detach(mob/living/target)
	target.remove_filter("element_rays")
	return ..()

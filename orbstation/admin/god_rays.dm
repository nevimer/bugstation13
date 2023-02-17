/// Adds and animates a rays filter
/atom/proc/add_god_rays(size = 32, color = COLOR_WHITE, amount = 12, xoffset = 0, yoffset = 0, loop_time = 1 MINUTES)
	. = ..()
	add_filter(name = "god_rays", priority = 1, params = list(
			type = "rays",
			size = size,
			color = color,
			density = amount
		))
	animate(get_filter("god_rays"), offset = 10, time = loop_time / 2, loop = -1)
	animate(offset = 0, time = loop_time / 2)

/// Removes the rays filter
/atom/proc/remove_god_rays()
	remove_filter("god_rays")
	return ..()

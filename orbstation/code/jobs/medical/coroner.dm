/datum/job/coroner
	family_heirlooms = list(/obj/item/clothing/head/helmet/skull, /obj/item/table_clock/heirloom)

/// A silent, permanently broken table clock for the coroner's heirloom
/obj/item/table_clock/heirloom
	desc = "While this clock was broken beyond repair for its annoying ticking, it still holds some sentimental value."
	times_broken = 3 //unrepairable

/// Immediately break the table clock on load
/obj/item/table_clock/heirloom/Initialize(mapload)
	. = ..()
	broken = TRUE
	soundloop.stop()
	update_appearance(UPDATE_ICON)

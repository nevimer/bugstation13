// Framework for Orbstation additions to the techweb.
/datum/techweb_node
	//Extra items to be unlocked by an existing techweb node
	var/list/orb_design_ids = list()

/datum/techweb_node/New()
	design_ids += orb_design_ids
	return ..()

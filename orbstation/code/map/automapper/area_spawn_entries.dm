// Job spawners
/datum/area_spawn/sci_ass_landmark
	target_areas = list(/area/station/science/lab, /area/station/science/research)
	desired_atom = /obj/effect/landmark/start/assistant/dept/sci

/datum/area_spawn/med_ass_landmark
	target_areas = list(/area/station/medical/treatment_center, /area/station/medical/medbay/central)
	desired_atom = /obj/effect/landmark/start/assistant/dept/med

/datum/area_spawn/eng_ass_landmark
	target_areas = list(/area/station/engineering/break_room, /area/station/engineering/main)
	desired_atom = /obj/effect/landmark/start/assistant/dept/eng

/datum/area_spawn/srv_ass_landmark
	target_areas = list(/area/station/commons/lounge, /area/station/service/bar, /area/station/hallway/secondary/service)
	desired_atom = /obj/effect/landmark/start/assistant/dept/srv

// Replace the main hub with the common server
/datum/traitor_objective/sabotage_machinery/destroy
	applicable_jobs = list(
		JOB_STATION_ENGINEER = /obj/machinery/telecomms/server/presets/common,
		JOB_SCIENTIST = /obj/machinery/rnd/server,
	)

/// Station trait that gives the station information on syndicate activity on the station, but also fires false positives
/datum/station_trait/sensitive_equipment
	name =  "Advanced Sensory Equipment"
	trait_type = STATION_TRAIT_NEUTRAL
	weight = 5
	show_in_report = TRUE
	report_message = "We have installed advanced sensors, we will alert you to all syndicate activity on the station."
	trait_processes = TRUE

	force = TRUE // TURN THIS OFF

/datum/station_trait/sensitive_equipment/on_round_start()
	. = ..()


/// Accuratly reads signals to alert the crew that a traitor secondary objective has been turned in
/obj/machinery/announcement_system/proc/announce_uplink_objective()
	if (!is_operational)
		return
	broadcast("We have detected encrypted communications that indicate a succesful enemy operation.", list(RADIO_CHANNEL_COMMON, RADIO_CHANNEL_SECURITY))

/// Accuratly reads signals to alert the crew that an item has been bought or an objective has been turned in
/obj/machinery/announcement_system/proc/announce_uplink_purchase()
	if (!is_operational)
		return
	broadcast("We have detected illicit market activity on the station.", list(RADIO_CHANNEL_COMMON, RADIO_CHANNEL_SECURITY))

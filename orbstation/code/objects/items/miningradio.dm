#define WEATHER_ALERT_CLEAR 0
#define WEATHER_ALERT_INCOMING 1
#define WEATHER_ALERT_IMMINENT_OR_ACTIVE 2

/obj/item/radio/miningradio
	icon = 'icons/obj/miningradio.dmi'
	name = "mining weather radio"
	icon_state = "miningradio"
	desc = "A weather radio designed for use in inhospitable environments. Gives audible warnings when storms approach. Has access to cargo channel."
	freqlock = RADIO_FREQENCY_LOCKED
	/// Currently displayed warning level
	var/warning_level = WEATHER_ALERT_CLEAR
	/// Whether the incoming weather is actually going to harm you
	var/is_weather_dangerous = TRUE

/obj/item/radio/miningradio/Initialize(mapload)
	. = ..()
	set_frequency(FREQ_SUPPLY)
	START_PROCESSING(SSprocessing, src)

/obj/item/radio/miningradio/update_overlays()
	. = ..()
	switch (warning_level)
		if(0)
			. += "weatherwarning"
		if(1)
			. += "urgentwarning"
		if(2)
			. += (is_weather_dangerous) ? "direwarning" : "urgentwarning"

/obj/item/radio/miningradio/process(seconds_per_tick)
	var/previous_level = warning_level
	var/previous_danger = is_weather_dangerous
	set_current_alert_level()
	if(previous_level == warning_level && previous_danger == is_weather_dangerous)
		return // No change
	say(get_warning_message())
	update_appearance(UPDATE_ICON)

/// Returns a string we should display to communicate what you should be doing
/obj/item/radio/miningradio/proc/get_warning_message()
	if (!is_weather_dangerous)
		return "No risk expected from incoming weather front."
	switch(warning_level)
		if(WEATHER_ALERT_CLEAR)
			return "All clear, no weather alerts to report."
		if(WEATHER_ALERT_INCOMING)
			return "Weather front incoming, begin to seek shelter."
		if(WEATHER_ALERT_IMMINENT_OR_ACTIVE)
			return "Weather front imminent, find shelter immediately."
	return "Error in meteorological calculation. Please report this deviation to a trained programmer."

/// Polls existing weather for what kind of warnings we should be displaying.
/obj/item/radio/miningradio/proc/set_current_alert_level()
	var/list/mining_z_levels = SSmapping.levels_by_trait(ZTRAIT_MINING)
	if(!length(mining_z_levels))
		return // No problems if there are no mining z levels

	for(var/datum/weather/check_weather as anything in SSweather.processing)
		if(!check_weather.barometer_predictable || check_weather.stage == WIND_DOWN_STAGE || check_weather.stage == END_STAGE)
			continue
		for (var/mining_level in mining_z_levels)
			if(mining_level in check_weather.impacted_z_levels)
				is_weather_dangerous = !check_weather.aesthetic
				warning_level = WEATHER_ALERT_IMMINENT_OR_ACTIVE
				return

	is_weather_dangerous = TRUE // We don't actually know until it arrives so err with caution
	var/soonest_active_weather = INFINITY
	for(var/mining_level in mining_z_levels)
		var/next_time = timeleft(SSweather.next_hit_by_zlevel["[mining_level ]"]) || INFINITY
		if (next_time && next_time < soonest_active_weather)
			soonest_active_weather = next_time

	if(soonest_active_weather < 30 SECONDS)
		warning_level = WEATHER_ALERT_IMMINENT_OR_ACTIVE
		return

	if(soonest_active_weather < 2 MINUTES)
		warning_level = WEATHER_ALERT_INCOMING
		return

	warning_level = WEATHER_ALERT_CLEAR

// place these at the very bottom of the file
#undef WEATHER_ALERT_CLEAR
#undef WEATHER_ALERT_INCOMING
#undef WEATHER_ALERT_IMMINENT_OR_ACTIVE


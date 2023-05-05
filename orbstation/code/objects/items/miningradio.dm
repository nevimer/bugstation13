#define WEATHER_ALERT_CLEAR 0
#define WEATHER_ALERT_INCOMING 1
#define WEATHER_ALERT_IMMINENT_OR_ACTIVE 2

/obj/item/radio/miningradio
	icon = 'icons/obj/miningradio.dmi'
	name = "mining weather radio"
	icon_state = "miningradio"
	desc = "A weather radio designed for use in inhospitable environments. Gives audible warnings when storms approach. Has access to cargo channel."
	var/warning_level = 0
	freqlock = RADIO_FREQENCY_LOCKED

/obj/item/radio/miningradio/update_overlays()
	. = ..()
	switch (warning_level)
		if(0)
			. += "weatherwarning"
		if(1)
			. += "urgentwarning"
		if(2)
			. += "direwarning"

/obj/item/radio/miningradio/Initialize(mapload)
	. = ..()
	set_frequency(FREQ_SUPPLY)
	START_PROCESSING(SSprocessing, src)

/obj/item/radio/miningradio/process(seconds_per_tick)
	var/previous_level = warning_level
	warning_level = get_current_alert_level()
	if(previous_level == warning_level)
		return // No change
	var/warning_message
	switch(warning_level)
		if(WEATHER_ALERT_CLEAR)
			warning_message = "All clear, no weather alerts to report."
		if(WEATHER_ALERT_INCOMING)
			warning_message  = "Weather front incoming, begin to seek shelter."
		if(WEATHER_ALERT_IMMINENT_OR_ACTIVE)
			warning_message = "Weather front imminent, find shelter immediately."
	say(warning_message)
	update_appearance(UPDATE_ICON)

/// Returns the current weather alert level we should be displaying
/obj/item/radio/miningradio/proc/get_current_alert_level()
	var/list/mining_z_levels = SSmapping.levels_by_trait(ZTRAIT_MINING)
	if(!length(mining_z_levels))
		return WEATHER_ALERT_CLEAR // No problems if there are no mining z levels

	for(var/datum/weather/check_weather as anything in SSweather.processing)
		if(!check_weather.barometer_predictable || check_weather.stage == WIND_DOWN_STAGE || check_weather.stage == END_STAGE)
			continue
		for (var/mining_level in mining_z_levels)
			if(mining_level in check_weather.impacted_z_levels)
				return WEATHER_ALERT_IMMINENT_OR_ACTIVE

	var/soonest_active_weather = INFINITY
	for(var/mining_level in mining_z_levels)
		var/next_time = timeleft(SSweather.next_hit_by_zlevel["[mining_level ]"]) || INFINITY
		if (next_time && next_time < soonest_active_weather)
			soonest_active_weather = next_time

	if(soonest_active_weather < 1 MINUTES)
		return WEATHER_ALERT_IMMINENT_OR_ACTIVE
	if(soonest_active_weather < 3 MINUTES)
		return WEATHER_ALERT_INCOMING
	return WEATHER_ALERT_CLEAR

// place these at the very bottom of the file
#undef WEATHER_ALERT_CLEAR
#undef WEATHER_ALERT_INCOMING
#undef WEATHER_ALERT_IMMINENT_OR_ACTIVE


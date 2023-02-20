/turf/closed/wall/r_wall/fakewood
	desc = "A huge chunk of reinforced metal used to separate rooms. This one has been painted like a log."
	color = COLOR_ORANGE_BROWN

/turf/open/water/jungle/biodome
	name="Biodome Lake"

/turf/open/water/jungle/biodome/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/lazy_fishing_spot, FISHING_SPOT_PRESET_BEACH)

/turf/open/misc/ashplanet/wateryrock/biodome
	name="Biodome Lake Rocks"
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS

/turf/open/lava/plasma/biodome
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	baseturfs = /turf/open/lava/plasma/biodome


/turf/open/floor/fake_snow/safe
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	slowdown = 0

SUBSYSTEM_DEF(language)
	name = "Language"
	init_order = INIT_ORDER_LANGUAGE
	flags = SS_NO_FIRE

/datum/controller/subsystem/language/Initialize()
	setup_language_list() // ORBSTATION REPLACEMENT (code moved to global proc)
	return SS_INIT_SUCCESS

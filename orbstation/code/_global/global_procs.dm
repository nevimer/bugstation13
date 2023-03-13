// Initializes the global language list. Used in a couple different places. Named this way for future-proofing.
/proc/orb_init_languages()
	if(GLOB.all_languages.len)
		return
	for(var/language in subtypesof(/datum/language))
		var/datum/language/language_type = language
		if(!initial(language_type.key))
			continue

		GLOB.all_languages += language_type

		var/datum/language/instance = new language_type

		GLOB.language_datum_instances[language_type] = instance

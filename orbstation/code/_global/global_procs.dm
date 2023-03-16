// Initializes the global language list, if it does not already exist. Used in a couple different places.
/proc/setup_language_list()
	if(GLOB.all_languages.len)
		return
	for(var/datum/language/language_type as anything in subtypesof(/datum/language))
		if(!initial(language_type.key))
			continue

		GLOB.all_languages += language_type

		var/datum/language/instance = new language_type

		GLOB.language_datum_instances[language_type] = instance

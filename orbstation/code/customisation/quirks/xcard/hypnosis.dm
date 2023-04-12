// Don't apply if you are immune
/datum/brain_trauma/hypnosis/on_gain()
	if (!HAS_TRAIT(owner, TRAIT_XCARD_HYPNOSIS))
		return ..()
	to_chat(owner, span_boldwarning("You feel a splitting pain in your head and your mind goes blank!"))
	to_chat(owner, span_notice("You cannot remember what just triggered this."))
	var/migraine_glow = owner.client?.prefs?.read_preference(/datum/preference/toggle/darkened_flash) ? \
		/atom/movable/screen/fullscreen/flash/black : \
		/atom/movable/screen/fullscreen/flash
	owner.overlay_fullscreen("migraine", migraine_glow)
	addtimer(CALLBACK(owner, TYPE_PROC_REF(/mob/, clear_fullscreen), "migraine", 5 SECONDS), 5 SECONDS)
	owner.Stun(15 SECONDS)
	owner.set_stutter_if_lower(1 MINUTES)
	owner.set_hallucinations_if_lower(3 MINUTES)
	qdel(src)

/datum/smite/deadchatpossession
	name = "Ghost Control"

/datum/smite/deadchatpossession/effect(client/user, mob/living/target)
	target.AddComponent(/datum/component/deadchat_control/cardinal_movement, ANARCHY_MODE, list(
		"spin" = CALLBACK(target, TYPE_PROC_REF(/mob, emote), "spin"),
		"flip" = CALLBACK(target, TYPE_PROC_REF(/mob, emote), "flip"),
		"cry" = CALLBACK(target, TYPE_PROC_REF(/mob, emote), "cry"),
		"laugh" = CALLBACK(target, TYPE_PROC_REF(/mob, emote), "laugh"),
		"scream" = CALLBACK(target, TYPE_PROC_REF(/mob, emote), "scream"),
		"swear" = CALLBACK(target, TYPE_PROC_REF(/mob, emote), "swear"),
		"clap" = CALLBACK(target, TYPE_PROC_REF(/mob, emote), "clap"),
		"fall" = CALLBACK(target, TYPE_PROC_REF(/mob/living, Knockdown), 1 SECONDS),
		"drop" = CALLBACK(target, TYPE_PROC_REF(/mob, drop_all_held_items)),
		"throw" = CALLBACK(target, TYPE_PROC_REF(/mob, throw_item), get_edge_target_turf(target, pick(GLOB.alldirs))),
		"shove" = CALLBACK(src, PROC_REF(ghost_shove), target),
		"sit" = CALLBACK(src, PROC_REF(ghost_sit), target),
		"stand" = CALLBACK(target, TYPE_PROC_REF(/mob/living, resist_buckle)),
		"walk" = CALLBACK(src, PROC_REF(ghost_speed), target, MOVE_INTENT_WALK),
		"run" = CALLBACK(src, PROC_REF(ghost_speed), target, MOVE_INTENT_RUN),
		), 7 SECONDS)

	to_chat(target, span_revenwarning("You feel a ghastly presence!!!"))


/datum/smite/deadchatpossession/proc/ghost_shove(mob/living/carbon/target)
	if(!istype(target) || target.get_active_held_item())
		return
	var/list/shoveables = list()
	for(var/mob/living/victim in orange(1, target))
		shoveables += victim
	if(!length(shoveables))
		return
	var/mob/living/shove_me = pick(shoveables)
	target.attack_hand_secondary(shove_me)

/datum/smite/deadchatpossession/proc/ghost_sit(mob/living/target)
	if(HAS_TRAIT(target, TRAIT_IMMOBILIZED))
		return
	var/list/chairs = list()
	for(var/obj/structure/chair/possible_chair in range(1, target))
		chairs += possible_chair
	if(!length(chairs))
		return
	var/obj/structure/chair/sitting_chair = pick(chairs)
	sitting_chair.buckle_mob(target, check_loc = FALSE)

/datum/smite/deadchatpossession/proc/ghost_speed(mob/living/target, new_speed)
	if(target.m_intent == new_speed)
		return
	target.toggle_move_intent()

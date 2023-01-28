/// A carp spawned from a minor carp rift, tasked to make sure it is not destroyed
/datum/antagonist/rift_carp
	name = "\improper Space Carp"
	roundend_category = "space dragons"
	antagpanel_category = ANTAG_GROUP_LEVIATHANS
	job_rank = ROLE_SENTIENCE
	show_name_in_check_antagonists = TRUE
	show_in_antagpanel = FALSE
	ui_name = "AntagInfoRiftCarp"
	/// Team of carp from the same rift
	var/datum/team/carp_team/team

/datum/antagonist/rift_carp/create_team(datum/team/carp_team/new_team)
	if(!new_team)
		return
	if(!istype(new_team))
		stack_trace("Wrong team type passed to [type] initialization.")
	team = new_team

/datum/antagonist/rift_carp/get_team()
	return team

/datum/antagonist/rift_carp/on_gain()
	objectives += team.objectives
	return ..()

/datum/antagonist/rift_carp/greet()
	. = ..()
	owner.announce_objectives()

/// Display all the carp at once in the round end
/datum/team/carp_team
	member_name = "\improper Space Carp"
	var/succeeded = FALSE

/datum/team/carp_team/New()
	..()
	name = "Carp Rift [pick(GLOB.greek_letters)]"
	var/datum/objective/custom/custom_objective = new()
	custom_objective.team = src
	custom_objective.name = "Protect the Carp Rift"
	custom_objective.explanation_text = "Protect the rift you emerged from until it is fully charged. The Carp stream must flow!"
	objectives += custom_objective

/// Called when rift is fully charged
/datum/team/carp_team/proc/succeed()
	succeeded = TRUE
	for (var/datum/mind/member as anything in members)
		to_chat(member, span_greentext("The carp rift has charged! Make sure your fellow Carp have a safe path for their migration!"))

/datum/team/carp_team/roundend_report()
	var/list/result = list()

	if(succeeded)
		result += "<span class='greentext big'>[name] was successfully defended!</span>"
		result += "<span class='greentext'>The next spawning season will be bountiful!</span>"
	else
		result += "<span class='redtext big'>[name] was destroyed!</span>"
		result += "<span class='redtext'>The carp will have to migrate through another path...</span>"

	result += "<span class='header'>The defenders of [name] were:</span>"
	for(var/datum/mind/carp_mind in members)
		result += printplayer(carp_mind)

	return "<div class='panel redborder'>[result.Join("<br>")]</div>"

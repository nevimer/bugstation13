/obj/item/clothing/glasses/boggle
	name = "boggle goggles"
	desc = "Now you can put eyes on your eyes for more eye per eye."
	worn_icon_state = "eyeglasses"
	gender = PLURAL
	custom_materials = null
	icon_state = "boggle"

	clothing_traits = list(TRAIT_NEARSIGHTED_CORRECTED,TRAIT_FARSIGHTED_CORRECTED)

/datum/crafting_recipe/boggle
	name = "Boggle Goggles"
	result = /obj/item/clothing/glasses/boggle
	time = 2 SECONDS
	reqs = list(/obj/item/organ/internal/eyes = 1, /obj/item/stack/sheet/cloth = 1)
	category = CAT_MISC

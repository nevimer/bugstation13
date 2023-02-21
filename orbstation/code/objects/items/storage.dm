// Survival boxes

/obj/item/storage/box/survival/PopulateContents()
	..()
	new /obj/item/crowbar(src)

/obj/item/storage/box/hug/survival/PopulateContents()
	..()
	new /obj/item/crowbar(src)

// Head of staff lockers

/obj/structure/closet/secure_closet/chief_medical/PopulateContents()
	..()
	new /obj/item/gun/energy/e_gun/mini(src)

/obj/structure/closet/secure_closet/research_director/PopulateContents()
	..()
	new /obj/item/gun/energy/e_gun/mini(src)

/obj/structure/closet/secure_closet/engineering_chief/PopulateContents()
	..()
	new /obj/item/gun/energy/e_gun/mini(src)

/obj/structure/closet/secure_closet/quartermaster/PopulateContents()
	..()
	new /obj/item/gun/energy/e_gun/mini(src)

/// Sets of gear summonable by the Contract Killer to aid in their kill.

/// Special briefcase for contract killer gear. Disguised as a regular secure briefcase.
/obj/item/storage/secure/briefcase/contract_killer
	throwforce = 25 //it's secretly a formidible throwing weapon
	throw_speed = 1 //but also kind of a joke
	throw_range = 7

	//how likely a kit is to be offered
	var/weight = CONTRACT_KILLER_KIT_COMMON
	//name of the kit in the gear selection menu
	var/kit_name = "Contract Killer Kit"
	//description to be shown in the gear selection menu
	var/gear_desc = "This kit should never be offered to you."

// COMMON KITS

/// A silenced Makarov with extra ammo, and some joke items
/obj/item/storage/secure/briefcase/contract_killer/hitman
	kit_name = "Hitman Kit"
	gear_desc = "Kill your target with simple, yet stylish efficiency. Contains a suppressed Makarov, a spare ammo magazine, \
		and a few bonuses to help you really look the part."

/obj/item/storage/secure/briefcase/contract_killer/hitman/PopulateContents()
	new /obj/item/gun/ballistic/automatic/pistol/suppressed(src)
	new /obj/item/ammo_box/magazine/m9mm(src)
	new /obj/item/clothing/under/suit/black(src)
	new /obj/item/clothing/suit/toggle/lawyer/black(src)
	new /obj/item/clothing/neck/tie/red(src)
	for(var/i in 1 to 3)
		new /obj/item/coin/silver(src)

/// A randomized selection of 10 knives of various usefulness
/obj/item/storage/secure/briefcase/contract_killer/knives
	kit_name = "A Random Assortment of Knives and Other Sharp Objects"
	gear_desc = "Like stabbing things? Want your target to look like a pincushion? This kit contains 15 knives, tossed together \
		more or less at random. Guaranteed to always contain a couple of really nice ones."
	var/static/list/rare_knives = list(
		/obj/item/knife/combat,
		/obj/item/knife/bloodletter,
		/obj/item/pen/edagger,
		/obj/item/knife/rainbowknife,
	)
	var/static/list/uncommon_knives = list(
		/obj/item/knife/combat/survival,
		/obj/item/knife/butcher,
		/obj/item/knife/letter_opener,
		/obj/item/knife/combat/bone,
		/obj/item/knife/shiv/plastitanium,
		/obj/item/scalpel/advanced,
		/obj/item/clothing/glasses/sunglasses/gar,
		/obj/item/surgicaldrill,
	)
	var/static/list/common_knives = list(
		/obj/item/knife/hunting,
		/obj/item/boxcutter,
		/obj/item/knife/kitchen,
		/obj/item/knife/carp,
		/obj/item/scalpel,
		/obj/item/knife/shiv/carrot,
		/obj/item/knife/shiv,
		/obj/item/knife/shiv/titanium,
		/obj/item/knife/shiv/plasma,
	)

/obj/item/storage/secure/briefcase/contract_killer/knives/PopulateContents()
	for(var/i in 1 to 2) //2 really good knives
		var/new_knife = pick(rare_knives)
		new new_knife(src)

	for(var/i in 1 to 3) //3 decent knives
		var/new_knife = pick(uncommon_knives)
		new new_knife(src)

	for(var/i in 1 to 10) //10 other knives
		var/new_knife = pick(common_knives)
		new new_knife(src)

/// Chameleon gear, with the noslip chameleon shoes and an agent ID as a bonus
/obj/item/storage/secure/briefcase/contract_killer/spy
	kit_name = "Disguise Kit"
	gear_desc = "Worried about getting away with your crime? Disguise your outfit however you please - they'll never know who hit them! \
		Contains a full chameleon kit, with an extra set of no-slip chameleon shoes and a customizable agent ID."

/obj/item/storage/secure/briefcase/contract_killer/spy/PopulateContents()
	new /obj/item/storage/box/syndie_kit/chameleon(src)
	new /obj/item/clothing/shoes/chameleon/noslip(src)
	new /obj/item/card/id/advanced/chameleon(src)

/// A dart gun, two random poisons, antitoxin (for slimes), and a box of piercing syringes
/obj/item/storage/secure/briefcase/contract_killer/poison
	kit_name = "Poisoner's Kit"
	gear_desc = "What murder could be more classic than poison? Contains two bottles of random poisons, a box of armor-piercing syringes, \
		a compact syringe gun, and a bottle of pentetic acid (in case you screw up, or if your target is a jellyperson)."
	var/list/poisons_list = list(
		/obj/item/reagent_containers/cup/bottle/polonium,
		/obj/item/reagent_containers/cup/bottle/venom,
		/obj/item/reagent_containers/cup/bottle/fentanyl,
		/obj/item/reagent_containers/cup/bottle/spewium,
		/obj/item/reagent_containers/cup/bottle/cyanide,
		/obj/item/reagent_containers/cup/bottle/initropidril,
		/obj/item/reagent_containers/cup/bottle/pancuronium,
		/obj/item/reagent_containers/cup/bottle/sodium_thiopental,
		/obj/item/reagent_containers/cup/bottle/coniine,
		/obj/item/reagent_containers/cup/bottle/curare,
		/obj/item/reagent_containers/cup/bottle/amanitin,
	)

/obj/item/storage/secure/briefcase/contract_killer/poison/PopulateContents()
	new /obj/item/gun/syringe/syndicate()
	for(var/i in 1 to 2)
		var/poison = pick_n_take(poisons_list)
		new poison(src)
	new /obj/item/reagent_containers/cup/bottle/pentetic_acid(src)
	new /obj/item/storage/box/syringes/piercing(src)
	new /obj/item/gun/syringe/syndicate(src)

/// Both types of emag, a camera bug, a syndie toolbox, and advanced insuls.
/obj/item/storage/secure/briefcase/contract_killer/hacker
	kit_name = "Hacker's Toolkit"
	gear_desc = "Target in an inconvenient location? With this kit, you can get wherever you need to - and get eyes on the whole station. \
		Contains advanced insulated gloves, a camera bug, an emag, a doorjack, and a set of tools."

/obj/item/storage/secure/briefcase/contract_killer/hacker/PopulateContents()
	new /obj/item/clothing/gloves/chief_engineer(src)
	new /obj/item/camera_bug(src)
	new /obj/item/card/emag(src)
	new /obj/item/card/emag/doorjack(src)
	new /obj/item/storage/toolbox/syndicate(src) //shouldn't really fit in a briefcase, but it does anyway

// UNCOMMON KITS

/// A power fist and some oxygen tanks. Contains a power drill just for convenience.
/obj/item/storage/secure/briefcase/contract_killer/powerfist
	kit_name = "Power Fist Starter Kit"
	gear_desc = "Why be subtle when you can punch your target across the room? Contains a power fist, three oxygen tanks, and a power \
		drill for making adjustments."
	weight = CONTRACT_KILLER_KIT_UNCOMMON

/obj/item/storage/secure/briefcase/contract_killer/powerfist/PopulateContents()
	new /obj/item/melee/powerfist(src)
	for(var/i in 1 to 3)
		new /obj/item/tank/internals/oxygen/red(src)
	new /obj/item/screwdriver/power(src)

/// A briefcase with bag of holding-sized internal storage.
/obj/item/storage/secure/briefcase/contract_killer/holding
	kit_name = "Briefcase of Holding"
	gear_desc = "Do you prefer on-site procurement? Are you the ultimate pack rat? Never fear - this briefcase is much bigger on the \
		inside! Store whatever you need for your secret schemes inside. WARNING: Do not place within another bluespace storage device. \
		Personal injury and instant death may occur."
	weight = CONTRACT_KILLER_KIT_UNCOMMON

/obj/item/storage/secure/briefcase/contract_killer/holding/Initialize(mapload)
	. = ..()

	create_storage(max_specific_storage = WEIGHT_CLASS_GIGANTIC, max_total_storage = 35, max_slots = 30, storage_type = /datum/storage/bag_of_holding)
	atom_storage.allow_big_nesting = TRUE

/obj/item/storage/secure/briefcase/contract_killer/holding/PopulateContents()
	return //contains nothing

/// A chameleon projector, and a rush gland implanter to zoom away if you get caught
/obj/item/storage/secure/briefcase/contract_killer/prophunt
	kit_name = "Prop Hunter's Kit"
	gear_desc = "Why disguise as a person at all? With this kit, you can disguise as any object you can scan. They'll never suspect that the \
		potted plant was an assassin. Contains a chameleon projector. Also contains a rush gland autosurgeon, for quick getaways."
	weight = CONTRACT_KILLER_KIT_UNCOMMON

/obj/item/storage/secure/briefcase/contract_killer/prophunt/PopulateContents()
	new /obj/item/chameleon(src)
	new /obj/item/autosurgeon/rush_gland(src)

/// A ratfolk stomach, a cheese injector implant, and several wheels of cheese
/obj/item/storage/secure/briefcase/contract_killer/cheeserush
	kit_name = "Cheesy Assassin's Kit"
	gear_desc = "The real key to a clean assassination is speed. They'll never get away if you bring the CHEESE RUSH to bear. Contains a cheese injector \
		implant and three cheese wheels. Also contains a ratfolk stomach for non-ratfolk assassins to get their cheese on. Implant it quickly, it \
		may go bad in there."
	weight = CONTRACT_KILLER_KIT_UNCOMMON

/obj/item/storage/secure/briefcase/contract_killer/cheeserush/PopulateContents()
	new /obj/item/autosurgeon/rat_stomach(src)
	new /obj/item/implanter/cheese(src)
	for(var/i in 1 to 3)
		new /obj/item/food/cheese/wheel(src)

/// An assortment of Lavaland and Icemoon monster parts, to craft into whatever items you like.
/obj/item/storage/secure/briefcase/contract_killer/viscera
	kit_name = "Briefcase Full of Loose Viscera"
	gear_desc = "Whether miners or ashwalkers, the real champions are those who don't let anything go to waste. This bag of monster parts will \
		let you build your OWN arsenal, one piece at a time. Contains a large assortment of monster pieces for crafting, and some meat for... snacks?"
	desc = "A large briefcase with a digital locking system. It's concerningly damp."
	weight = CONTRACT_KILLER_KIT_UNCOMMON

/obj/item/storage/secure/briefcase/contract_killer/viscera/PopulateContents()
	for(var/i in 1 to 20)
		new /obj/item/stack/sheet/bone(src)
	for(var/i in 1 to 6)
		new /obj/item/stack/sheet/sinew(src)
	for(var/i in 1 to 3)
		if(prob(50))
			new /obj/item/stack/sheet/animalhide/goliath_hide(src)
		else
			new /obj/item/stack/sheet/animalhide/goliath_hide/polar_bear_hide(src)
		new /obj/item/food/meat/slab/goliath(src)
		new /obj/item/food/meat/slab/bear(src)
	if(prob(25))
		for(var/i in 1 to 5)
			new /obj/item/stack/sheet/animalhide/ashdrake(src)

// RARE KITS

/// A rare kit that gives a random piece of abductor/Zetan gear.
/obj/item/storage/secure/briefcase/contract_killer/zetan
	kit_name = "KILLING KIT FOR STRONG ASSASSINS"
	weight = CONTRACT_KILLER_KIT_RARE

/obj/item/storage/secure/briefcase/contract_killer/zetan/PopulateContents()
	var/choice = rand(3)
	switch(choice)
		if(1)
			new /obj/item/gun/energy/shrink_ray/unrestricted(src)
		if(2)
			new /obj/item/gun/zetan_revolver(src)
			new /obj/item/clothing/gloves/color/yellow(src)
		if(3)
			new /obj/item/gun/energy/alien/unrestricted(src)

/// A rare kit that gives two random wizard items.
/obj/item/storage/secure/briefcase/contract_killer/wizard
	kit_name = "Smuggled Wizard Federation Goods"
	gear_desc = "A pack of premium goods smuggled right out of the Wizard Federation. You can't tell anyone where you got these. If a wizard realizes \
		what you have here, they'll turn you into a chicken, or maybe inside-out. Keep it quiet. Contains two random wizardly items and a nice hat."
	weight = CONTRACT_KILLER_KIT_RARE
	var/list/wizard_items = list(
		/obj/item/book/granter/action/spell/forcewall,
		/obj/item/book/granter/action/spell/knock,
		/obj/item/book/granter/action/spell/lightningbolt,
		/obj/item/book/granter/action/spell/summonitem,
		/obj/item/gun/magic/wand/door,
		/obj/item/gun/magic/wand/fireball,
		/obj/item/gun/magic/wand/animate,
		/obj/item/gun/magic/wand/booze,
		/obj/item/gun/magic/wand/hallucination,
		/obj/item/gun/magic/wand/levitate,
		/obj/item/gun/magic/wand/pax,
		/obj/item/gun/magic/wand/prank,
		/obj/item/gun/magic/wand/repulse,
		/obj/item/gun/magic/wand/swap,
		/obj/item/gun/magic/wand/wound,
		/obj/item/veilrender/vealrender,
		/obj/item/veilrender/honkrender,
		/obj/item/scrying,
		/obj/item/warp_whistle,
	)
	var/list/wizard_hats = list(
		/obj/item/clothing/head/wizard,
		/obj/item/clothing/head/wizard/red,
		/obj/item/clothing/head/wizard/yellow,
		/obj/item/clothing/head/wizard/black,
		/obj/item/clothing/head/wizard/fake,
		/obj/item/clothing/head/wizard/marisa,
		/obj/item/clothing/head/wizard/tape,
	)

/obj/item/storage/secure/briefcase/contract_killer/wizard/PopulateContents()
	for(var/i in 1 to 2)
		var/wizard_item = pick_n_take(wizard_items)
		new wizard_item(src)
	var/wizard_hat = pick(wizard_hats)
	new wizard_hat(src)

/*
/// A belt with several random grenades. A poor choice for assassination - which is why it's rare.
/obj/item/storage/secure/briefcase/contract_killer/grenades
	kit_name = "Surplus Grenadier Belt"
	gear_desc = "Subtlety? Subtlety is beneath you. You know there's nothing more effective for a quiet assassination job than grenades. Still, try to \
		avoid collateral damage, if you can. Contains a belt with ??? random grenades."
	weight = CONTRACT_KILLER_KIT_RARE

/obj/item/storage/secure/briefcase/contract_killer/grenades/PopulateContents()
	new /obj/item/grenade/syndieminibomb(src)
	new /obj/item/grenade/syndieminibomb(src)*/

// Unique items for kits

/// An autosurgeon containing a special pre-preserved rush gland
/obj/item/autosurgeon/rush_gland
	name = "autosurgeon"
	desc = "A single use autosurgeon that contains a preserved rush gland. A screwdriver can be used to remove it, but implants can't be placed back in."
	uses = 1
	starting_organ = /obj/item/organ/internal/monster_core/rush_gland/preserved

/// An autosurgeon containing a ratfolk stomach. This will decay, so hopefully they use it quickly.
/obj/item/autosurgeon/rat_stomach
	name = "autosurgeon"
	desc = "A single use autosurgeon that contains a fresh ratfolk stomach. A screwdriver can be used to remove it, but implants can't be placed back in. \
		Use it quickly, as it is not immune to decay."
	uses = 1
	starting_organ = /obj/item/organ/internal/stomach/ratfolk

// Pre-preserved monster organs, to ensure they don't decay before use
/obj/item/organ/internal/monster_core/rush_gland/preserved/Initialize(mapload)
	. = ..()
	preserve()

/obj/item/organ/internal/monster_core/regenerative_core/legion/preserved/Initialize(mapload)
	. = ..()
	preserve()

/obj/item/organ/internal/monster_core/brimdust_sac/preserved/Initialize(mapload)
	. = ..()
	preserve()

// Variants of abductor weapons that have standard firing pins in them.
/obj/item/gun/energy/alien/unrestricted
	pin = /obj/item/firing_pin

/obj/item/gun/energy/shrink_ray/unrestricted
	pin = /obj/item/firing_pin

/// A bottle of pentetic acid.
/obj/item/reagent_containers/cup/bottle/pentetic_acid
	name = "pentetic acid bottle"
	desc = "A small bottle. Contains pentetic acid."
	list_reagents = list(/datum/reagent/medicine/pen_acid = 30)

/// A box containing six piercing syringes.
/obj/item/storage/box/syringes/piercing
	name = "box of piercing syringes"
	desc = "A box full of armor-piercing syringes."

/obj/item/storage/box/syringes/piercing/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/reagent_containers/syringe/piercing(src)

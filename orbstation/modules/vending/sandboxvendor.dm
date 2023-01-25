/obj/machinery/vending/sandboxvend
	name = "SandboxVend"
	desc = "Free tools to help you sandbox. Use at your own discretion, and try not to ruin the station for others."
	icon_state = "MagiVend"
	panel_type = "panel4"
	product_slogans = "Video games!;Find your true love here!;Slap it up!;It's all free!;Trans your gender!;Yayayayayay!"
	vend_reply = "Wahoo! Yay! Woohoo! Yahoo! Wow! Yippee! Yayayayayay!"
	max_integrity = 999999
	integrity_failure = 0.01
	tiltable = FALSE // i love you
	product_categories = list(
		list(
			"name" = "Essentials",
			"icon" = "star",
			"products" = list(
				/obj/item/card/id/advanced/gold/captains_spare = 999,
				/obj/item/storage/backpack/holding = 999,
				/obj/item/storage/box/material = 999,
				/obj/item/stock_parts/cell/infinite = 999,
				/obj/item/clothing/glasses/debug = 999,
				/obj/item/toy/balloon/corgi = 999,
				/obj/item/storage/box/hug/plushes = 999,
				/obj/item/choice_beacon/music = 999,
				/obj/item/choice_beacon/ingredient = 999,
				/obj/item/pizzabox/infinite = 999,
				/obj/item/stack/spacecash/c1000 = 999,
			),
		),

		list(
			"name" = "Tools",
			"icon" = "wrench",
			"products" = list(
				/obj/item/debug/omnitool = 999,
				/obj/item/door_remote/omni = 999,
				/obj/item/construction/rcd/combat/admin = 999,
				/obj/item/construction/rld/debug = 999,
				/obj/item/construction/rtd/admin = 999,
				/obj/item/pipe_dispenser = 999,
				/obj/item/construction/plumbing/debug = 999,
				/obj/item/storage/part_replacer/bluespace/tier4 = 999,
				/obj/item/holosign_creator/atmos/super = 999,
				/obj/item/airlock_painter/decal/debug = 999,
				/obj/item/toy/crayon/spraycan/infinite = 999,
				/obj/item/soap/omega = 999,
				/obj/item/healthanalyzer/advanced = 999,
				/obj/item/reagent_containers/hypospray/cmo = 999,
				/obj/item/gun/magic/wand/resurrection/debug = 999,
			),
		),

		list(
			"name" = "Equipment",
			"icon" = "briefcase",
			"products" = list(
				/obj/item/clothing/gloves/chief_engineer = 999,
				/obj/item/storage/belt/medical/ert = 999,
				/obj/item/storage/belt/utility/full/powertools = 999,
				/obj/item/clothing/shoes/magboots/advance = 999,
				/obj/item/radio/headset/headset_cent/commander = 999,
				/obj/item/storage/belt/military = 999,
				/obj/item/clothing/suit/armor/reactive = 999,
				/obj/item/assembly/signaler/anomaly/pyro = 999,
				/obj/item/assembly/signaler/anomaly/grav = 999,
				/obj/item/assembly/signaler/anomaly/flux = 999,
				/obj/item/assembly/signaler/anomaly/bluespace = 999,
				/obj/item/assembly/signaler/anomaly/vortex = 999,
				/obj/item/assembly/signaler/anomaly/bioscrambler = 999,
				/obj/item/assembly/signaler/anomaly/hallucination = 999,
				/obj/item/assembly/signaler/anomaly/dimensional = 999,
			),
		),

		list(
			"name" = "Potions",
			"icon" = "flask",
			"products" = list(
				/obj/item/reagent_containers/cup/bottle/potion/flight = 999,
				/obj/item/slimepotion/genderchange = 999,
				/obj/item/slimepotion/transference = 999,
				/obj/item/slimepotion/slime/sentience = 999,
				/obj/item/slimepotion/slime/renaming = 999,
				/obj/item/slimepotion/peacepotion = 999,
				/obj/item/slimepotion/spaceproof = 999,
				/obj/item/slimepotion/fireproof = 999,
			),
		),

		list(
			"name" = "Implants",
			"icon" = "heartbeat",
			"products" = list(
				/obj/item/autosurgeon/syndicate = 999,
				/obj/item/organ/internal/lungs/cybernetic/tier3 = 999,
				/obj/item/organ/internal/heart/cybernetic/tier3 = 999,
				/obj/item/organ/internal/liver/cybernetic/tier3 = 999,
				/obj/item/organ/internal/stomach/cybernetic/tier3 = 999,
				/obj/item/organ/internal/cyberimp/chest/nutriment/plus = 999,
				/obj/item/organ/internal/cyberimp/chest/reviver = 999,
				/obj/item/organ/internal/cyberimp/mouth/breathing_tube = 999,
				/obj/item/organ/internal/cyberimp/brain/anti_stun = 999,
				/obj/item/organ/internal/cyberimp/arm/toolset/l = 999,
				/obj/item/organ/internal/cyberimp/arm/surgery = 999,
				/obj/item/organ/internal/cyberimp/eyes/hud/medical = 999,
				/obj/item/organ/internal/heart/gland/ventcrawling = 999,
			),
		),
	)

	contraband = list(
		/obj/item/card/emag/bluespace = 99,
		/obj/item/disk/data/debug = 99,
		/obj/item/disk/surgery/debug = 99,
		/obj/item/disk/tech_disk/debug = 99,
		/obj/item/implanter/spell/teleport = 99,
		/obj/item/implanter/spell/jaunt = 99,
		/obj/item/implanter/storage = 99,
		/obj/item/implanter/radio/syndicate = 99,
		/obj/item/implanter/sad_trombone = 99,
		/obj/item/suspiciousphone = 99,
		/obj/item/guardiancreator/tech/choose/traitor = 99,
	)
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	refill_canister = /obj/item/vending_refill/clothing // wont populate categories without this
	default_price = 0
	extra_price = 0
	payment_department = NO_FREEBIES
	light_mask = "magivend-light-mask"
	light_color = LIGHT_COLOR_PURPLE

// if this stuff should be moved to different files, Sorry
/obj/item/toy/crayon/spraycan/infinite
	custom_price = 0

/obj/item/holosign_creator/atmos/super
	name = "super ATMOS holofan projector"
	desc = "A holographic projector that creates holographic barriers that prevent changes in atmosphere conditions. This one can support up to 99 barriers at once."
	max_signs = 99

/obj/item/construction/plumbing/debug
	name = "Debug Plumbing Constructor"
	matter = INFINITY
	max_matter = INFINITY

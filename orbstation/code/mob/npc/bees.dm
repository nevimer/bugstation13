// Variant of the poisonous bees summoned by the "Anthophillia" holodeck simulation, which die after stinging once.
/mob/living/simple_animal/hostile/bee/toxin/holo
	name = "holographic bee"
	desc = "Someone should probably turn that simulation off, huh?"

/mob/living/simple_animal/hostile/bee/toxin/holo/AttackingTarget()
	..()
	death(gibbed = FALSE)

/obj/effect/holodeck_effect/mobspawner/bee
	mobtype = /mob/living/simple_animal/hostile/bee/toxin/holo

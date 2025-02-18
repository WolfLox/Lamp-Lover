/obj/structure/blob/shield
	name = "strong blob"
	icon = 'icons/mob/blob.dmi'
	icon_state = "blob_shield"
	desc = "Сплошная стена слегка подергивающихся щупалец."
	var/damaged_desc = "Стена дергающихся щупалец."
	max_integrity = BLOB_STRONG_MAX_HP
	health_regen = BLOB_STRONG_HP_REGEN
	brute_resist = BLOB_STRONG_BRUTE_RESIST
	explosion_block = 3
	explosion_vertical_block = 2
	point_return = BLOB_REFUND_STRONG_COST
	atmosblock = TRUE
	armor = list("melee" = 0, "bullet" = 0, "laser" = 25, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 90, "acid" = 90)

/obj/structure/blob/shield/scannerreport()
	if(atmosblock)
		return "Will prevent the spread of atmospheric changes."
	return "N/A"

/obj/structure/blob/shield/core // Automatically generated by the core
	point_return = 0

/obj/structure/blob/shield/update_name(updates)
	. = ..()
	name = "[(compromised_integrity) ? "weakened " : null][initial(name)]"

/obj/structure/blob/shield/update_desc(updates)
	. = ..()
	desc = (compromised_integrity) ? "[damaged_desc]" : initial(desc)

/obj/structure/blob/shield/take_damage(damage_amount, damage_type, damage_flag, sound_effect, attack_dir)
	. = ..()
	if(. && obj_integrity > 0)
		atmosblock = compromised_integrity
		air_update_turf(TRUE, atmosblock)

/obj/structure/blob/shield/update_icon_state()
	icon_state = "[initial(icon_state)][(compromised_integrity) ? "_damaged" : null]"
	return ..()

/obj/structure/blob/shield/update_state()
	if(obj_integrity < max_integrity * 0.5)
		compromised_integrity = TRUE
	else
		compromised_integrity = FALSE
	if(compromised_integrity)
		atmosblock = FALSE
	else
		atmosblock = TRUE
	air_update_turf(1)


/obj/structure/blob/shield/reflective
	name = "reflective blob"
	desc = "A solid wall of slightly twitching tendrils with a reflective glow."
	damaged_desc = "A wall of twitching tendrils with a reflective glow."
	icon_state = "blob_glow"
	flags_ricochet = RICOCHET_SHINY
	point_return = BLOB_REFUND_REFLECTOR_COST
	explosion_block = 2
	explosion_vertical_block = 1
	max_integrity = BLOB_REFLECTOR_MAX_HP
	health_regen = BLOB_REFLECTOR_HP_REGEN
	brute_resist = BLOB_BRUTE_RESIST

/obj/structure/blob/shield/reflective/core // Automatically generated by the core
	point_return = 0

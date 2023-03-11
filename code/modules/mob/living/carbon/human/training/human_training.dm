/mob/living/carbon/human/human_training
	var/obj/training_master/training_master
	var/room_size_x = 11
	var/room_size_y = 7

/mob/living/carbon/human/human_training/Initialize(mapload, datum/species/new_species)
	training_master = new(find_place_for_room(), src)
	status_flags |= GODMODE
	add_language("Training Lang", 1)
	. = ..()

/mob/living/carbon/human/human_training/Logout()
	var/mob/new_player/NP = new()
	GLOB.non_respawnable_keys -= ckey
	NP.ckey = ckey
	training_master.destroy_room()
	qdel(src)
	. = ..()

/mob/living/carbon/human/human_training/proc/find_place_for_room()
	var/place
	for(var/x = 1, x < world.maxx - room_size_x, x += room_size_x)
		if (place)
			break
		for(var/y = 1, y < world.maxy - room_size_y, y += room_size_y)
			var/turf/turf = get_turf(locate(x, y, 1))
			if (istype(turf, /turf/space))
				place = locate(x, y, 1)
				break
	return place

/mob/living/carbon/human/human_training/proc/reset_inventory()
	delete_equipment()
	equip_to_slot_if_possible(new /obj/item/clothing/shoes/orange, slot_shoes)
	equip_to_slot_if_possible(new /obj/item/clothing/under/color/orange, slot_w_uniform)

/obj/machinery/computer/shuttle/ninja
	name = "Spider Clan \"Ombra\" shuttle console"
	desc = "Используется для вызова и отправки шаттла \"Ombra\"."
	icon_keyboard = "generic_key"
	icon_screen = "ninja_shuttle"
	req_access = list()
	bubble_icon = "syndibot"
	shuttleId = "ombra"
	possible_destinations = "ombra_home;ombra_away;ombra_custom"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	obj_flags = NODECONSTRUCT


/obj/machinery/computer/camera_advanced/shuttle_docker/ninja
	name = "Spider Clan \"Ombra\" shuttle navigation computer"
	desc = "Используется, чтобы указать точное местоположение для отправки шаттла \"Ombra\"."
	icon_screen = "ninja_navigation"
	icon_keyboard = "generic_key"
	shuttleId = "ombra"
	shuttlePortId = "ombra_custom"
	bubble_icon = "syndibot"
	view_range = 13
	x_offset = -5
	y_offset = -1
	see_hidden = TRUE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	obj_flags = NODECONSTRUCT

/area/shuttle/ninja
	icon_state = "shuttlegrn"
	name = "\improper Spider Clan \"Ombra\" Shuttle"
	nad_allowed = TRUE
	area_flags = NONE

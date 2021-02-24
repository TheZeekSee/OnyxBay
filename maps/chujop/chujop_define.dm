
/datum/map/chujop
	name = "Nostromo"
	full_name = "USCSS NOSTROMO"
	path = "chujop"

	lobby_icon = 'maps/exodus/exodus_lobby.dmi'

	load_legacy_saves = TRUE

	station_levels = list(1, 2)
	admin_levels = list(3)
	contact_levels = list(1,2,4,6)
	player_levels = list(1,2,4,5,6,7,8,9,10,11,12)
	//sealed_levels = list(6)
	empty_levels = list(6)
	accessible_z_levels = list("1" = 5, "2" = 5, "4" = 10, "5" = 15, "6" = 15, "7" = 30, "8" = 5, "9" = 5, "10" = 5, "11" = 5, "12" = 5)
	dynamic_z_levels = list()

	station_name  = "USCSS NOSTROMO"
	station_short = "NOSTROMO"
	dock_name     = "NAS Crescent"
	boss_name     = "Weyland-Yutani"
	boss_short    = "Wey-Yu"
	company_name  = "TranStar"
	company_short = "TS"
	system_name   = "LV"

	shuttle_docked_message = "The scheduled Crew Transfer Shuttle to %Dock_name% has docked with the station. It will depart in approximately %ETD%"
	shuttle_leaving_dock = "The Crew Transfer Shuttle has left the station. Estimate %ETA% until the shuttle docks at %dock_name%."
	shuttle_called_message = "A crew transfer to %Dock_name% has been scheduled. The shuttle has been called. It will arrive in approximately %ETA%"
	shuttle_recall_message = "The scheduled crew transfer has been cancelled."

	evac_controller_type = /datum/evacuation_controller/shuttle

/datum/map/exodus/perform_map_generation()
	new /datum/random_map/automata/cave_system(null, 1, 1, 6, 255, 255) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, 6, 255, 255)         // Create the mining ore distribution map.
	return 1
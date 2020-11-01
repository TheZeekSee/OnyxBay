/mob/living/bot
	name = "Folzbot"
	health = 999
	maxHealth = 999
	icon = 'icons/folzbot.dmi'
	universal_speak = 0
	density = 0
	var/obj/item/weapon/card/id/botcard = null
	var/list/botcard_access = list()
	var/on = 0
	var/open = 0
	var/locked = 1
	var/emagged = 1
	var/light_strength = 2
	var/busy = 0

	var/obj/access_scanner = null
	var/list/req_access = list()
	var/list/req_one_access = list()

	var/atom/target = null
	var/list/ignore_list = list()
	var/list/patrol_path = list()
	var/list/target_path = list()
	var/turf/obstacle = null

	var/wait_if_pulled = 1 // Only applies to moving to the target
	var/will_patrol = 0 // If set to 1, will patrol, duh
	var/patrol_speed = 1 // How many times per tick we move when patrolling
	var/target_speed = 2 // Ditto for chasing the target
	var/min_target_dist = 1 // How close we try to get to the target
	var/max_target_dist = 50 // How far we are willing to go
	var/max_patrol_dist = 250
	var/RequiresAccessToToggle = 0 // If 1, will check access to be turned on/off

	var/target_patience = 5
	var/frustration = 0
	var/max_frustration = 0
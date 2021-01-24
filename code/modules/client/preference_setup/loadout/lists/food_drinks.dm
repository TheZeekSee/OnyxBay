/datum/gear/drinks
	sort_category = "Food and Drinks"

/datum/gear/drinks/absinthe
	display_name = "jailbreaker verte"
	path = /obj/item/weapon/reagent_containers/food/drinks/bottle/absinthe

/datum/gear/drinks/melonliquor
	display_name = "emeraldine melon liquor"
	path = /obj/item/weapon/reagent_containers/food/drinks/bottle/melonliquor

/datum/gear/drinks/bluecuracao
	display_name = "miss blue curacao"
	path = /obj/item/weapon/reagent_containers/food/drinks/bottle/bluecuracao

/datum/gear/drinks/grenadine
	display_name = "briar rose grenadine syrup"
	path = /obj/item/weapon/reagent_containers/food/drinks/bottle/grenadine

/datum/gear/drinks/pwine
	display_name = "warlock's velvet"
	path = /obj/item/weapon/reagent_containers/food/drinks/bottle/pwine

/datum/gear/drinks/absinthe
	display_name = "premium wine"
	path = /obj/item/weapon/reagent_containers/food/drinks/bottle/premiumwine

/datum/gear/food
	sort_category = "Food and Drinks"
	cost = 2

/datum/gear/food/lunchbox/common
	display_name = "lunchbox"
	path = /obj/item/weapon/storage/lunchbox/filled

/datum/gear/food/lunchbox/heart
	display_name = "heart lunchbox"
	path = /obj/item/weapon/storage/lunchbox/heart/filled

/datum/gear/food/lunchbox/cat
	display_name = "cat lunchbox"
	path = /obj/item/weapon/storage/lunchbox/cat/filled

/datum/gear/food/lunchbox/nt
	display_name = "nt lunchbox"
	path = /obj/item/weapon/storage/lunchbox/nt/filled

/datum/gear/food/lunchbox/nymph
	display_name = "diona nymph lunchbox"
	path = /obj/item/weapon/storage/lunchbox/nymph/filled

/datum/gear/food/lunchbox/cti
	display_name = "cti lunchbox"
	path = /obj/item/weapon/storage/lunchbox/cti/filled

/datum/gear/food/lunchbox/mars
	display_name = "mariner university lunchbox"
	path = /obj/item/weapon/storage/lunchbox/mars/filled
<<<<<<< HEAD
=======

/datum/gear/flask
	sort_category = "Food and Drinks"
	display_name = "flask"
	path = /obj/item/weapon/reagent_containers/food/drinks/flask
	price = 5

/datum/gear/flask/New()
	..()
	gear_tweaks += new /datum/gear_tweak/reagents(lunchables_ethanol_reagents())

/datum/gear/flask/bar
	display_name = "bar flask"
	path = /obj/item/weapon/reagent_containers/food/drinks/flask/barflask
	price = 0

/datum/gear/flask/vacuum
	display_name = "vacuum flask"
	path = /obj/item/weapon/reagent_containers/food/drinks/flask/vacuumflask
	price = 0

/datum/gear/flask/lithium
	display_name = "lithium flask"
	path = /obj/item/weapon/reagent_containers/food/drinks/flask/lithium
	price = 8

/datum/gear/flask/shiny
	display_name = "shiny flask"
	path = /obj/item/weapon/reagent_containers/food/drinks/flask/shiny
	price = 10
>>>>>>> upstream/release/chaotic

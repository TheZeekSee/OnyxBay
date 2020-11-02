/obj/item/weapon/gun/launcher/gips
	name = "GIPS gun"
	desc = "The Transtar gel immobilizing portable system (GIPS gun) disables or immobilizes targets without harming them. With the help of a GYPSUM gun, you can also extinguish the flame and temporarily eliminate the breakdown of electrical insulation. The hardened foam can withstand human weight."
	icon_state = "gipsgun"
	item_state = "gipsgun"
	fire_sound = 'sound/weapons/empty.ogg'
	fire_sound_text = "a metallic thunk"

	var/obj/item/weapon/gips_shell/chambered

/obj/item/weapon/gips_shell
	name = "GIPS gun shell"
	desc = "A casing with a foamed mass"
	icon = 'icons/obj/ammo.dmi'
	icon_state = "gipsshell"

/obj/item/weapon/gun/launcher/gips/examine(mob/user)
	. = ..()
	if(get_dist(src, user) <= 2 && chambered)
		. += "\n\A [chambered] is chambered."

/obj/item/weapon/gun/launcher/gips/proc/load(obj/item/weapon/gips_shell/S, mob/user)
	if(chambered)
		to_chat(user, "<span class='warning'>\The [src] already has a shell loaded.</span>")
		return

	user.drop_from_inventory(S, src)
	chambered = S
	user.visible_message("\The [user] inserts \a [S] into \the [src].", "<span class='notice'>You insert \a [S] into \the [src].</span>")

/obj/item/weapon/gun/launcher/gips/proc/unload(mob/user)
	if(chambered)
		user.visible_message("\The [user] removes \the [chambered] from \the [src].", "<span class='notice'>You remove \the [chambered] from \the [src].</span>")
		user.put_in_hands(chambered)
		chambered = null
	else
		to_chat(user, "<span class='warning'>\The [src] is empty.</span>")

/obj/item/weapon/gun/launcher/gips/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/weapon/gips_shell)))
		load(I, user)
	else
		..()

/obj/item/weapon/gun/launcher/gips/attack_hand(mob/user)
	if(user.get_inactive_hand() == src)
		unload(user)
	else
		..()

/obj/item/weapon/gun/launcher/gips/consume_next_projectile()
	if(chambered)
		qdel(chambered)
		chambered = null
		return new /obj/item/weapon/energy_net/safari(src)

	return null

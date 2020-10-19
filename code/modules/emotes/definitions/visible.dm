/decl/emote/visible
	key ="tail"
	emote_message_3p = "USER машет USER_THEIR хвостом."
	message_type = VISIBLE_MESSAGE

/decl/emote/visible/scratch
	key = "scratch"
	check_restraints = TRUE
	emote_message_3p = "USER чешется."

/decl/emote/visible/drool
	key ="drool"
	emote_message_3p = "USER пускает слюни."
	conscious = 0

/decl/emote/visible/nod
	key ="nod"
	emote_message_3p = "USER кивает."

/decl/emote/visible/sway
	key ="sway"
	emote_message_3p = "USER качается от головокружения."

/decl/emote/visible/sulk
	key ="sulk"
	emote_message_3p = "USER печально дуется."

/decl/emote/visible/dance
	key ="dance"
	check_restraints = TRUE
	emote_message_3p = "USER танцует."

/decl/emote/visible/roll
	key ="roll"
	check_restraints = TRUE
	emote_message_3p = "USER кувыркается."

/decl/emote/visible/shake
	key ="shake"
	emote_message_3p = "USER качает головой."

/decl/emote/visible/jump
	key ="jump"
	emote_message_3p = "USER прыгает!"

/decl/emote/visible/hiss
	key ="hiss_"
	emote_message_3p = "USER тихо шипит."

/decl/emote/visible/shiver
	key ="shiver"
	emote_message_3p = "USER вздрагивает."
	conscious = 0

/decl/emote/visible/collapse
	key ="collapse"
	emote_message_3p = "USER падает!"

/decl/emote/visible/collapse/do_extra(mob/user)
	if(istype(user))
		user.Paralyse(2)

/decl/emote/visible/flash
	key = "flash"
	emote_message_3p = "Лампочки на USER быстро моргают."

/decl/emote/visible/blink
	key = "blink"
	emote_message_3p = "USER моргает."

/decl/emote/visible/airguitar
	key = "airguitar"
	check_restraints = TRUE
	emote_message_3p = "USER бренчит в воздухе и трясет головой, как шимпанзе сафари."

/decl/emote/visible/blink_r
	key = "blink_r"
	emote_message_3p = "USER быстро моргает."

/decl/emote/visible/bow
	key = "bow"
	emote_message_3p_target = "USER кланяется TARGET."
	emote_message_3p = "USER кланяется."

/decl/emote/visible/salute
	key = "salute"
	emote_message_3p_target = "USER делает воинское приветствие TARGET."
	emote_message_3p = "USER делает воинское приветствие."
	emote_sound = 'sound/effects/salute.ogg'

/decl/emote/visible/flap
	key = "flap"
	check_restraints = TRUE
	emote_message_3p = "USER машет крыльями."

/decl/emote/visible/aflap
	key = "aflap"
	check_restraints = TRUE
	emote_message_3p = "USER агрессивно машет крыльями!"

/decl/emote/visible/eyebrow
	key = "eyebrow"
	emote_message_3p = "USER приподнимает бровь."

/decl/emote/visible/twitch
	key = "twitch"
	emote_message_3p = "USER дёргается."
	conscious = 0

/decl/emote/visible/twitch_v
	key = "twitch_v"
	emote_message_3p = "USER быстро дёргается."
	conscious = 0

/decl/emote/visible/faint
	key = "faint"
	emote_message_3p = "USER падает в обморок."

/decl/emote/visible/faint/do_extra(mob/user)
	if(istype(user) && user.sleeping <= 0)
		user.sleeping += 10

/decl/emote/visible/frown
	key = "frown"
	emote_message_3p = "USER хмурится."

/decl/emote/visible/blush
	key = "blush"
	emote_message_3p = "USER краснеет."

/decl/emote/visible/wave
	key = "wave"
	emote_message_3p = "USER махает рукой."
	emote_message_3p_target = "USER махает рукой TARGET."

/decl/emote/visible/glare
	key = "glare"
	emote_message_3p = "USER смотрит с ненавистью на TARGET."
	emote_message_3p = "USER смотрит с ненавистью."

/decl/emote/visible/stare
	key = "stare"
	emote_message_3p = "USER пялится на TARGET."
	emote_message_3p = "USER пялится."

/decl/emote/visible/look
	key = "look"
	emote_message_3p = "USER смотрит на TARGET."
	emote_message_3p = "USER смотрит."

/decl/emote/visible/point
	key = "point"
	check_restraints = TRUE
	emote_message_3p = "USER указывает."
	emote_message_3p_target = "USER указывает на TARGET."

/decl/emote/visible/raise
	key = "raise"
	check_restraints = TRUE
	emote_message_3p = "USER поднимает руку."

/decl/emote/visible/grin
	key = "grin"
	emote_message_3p = "USER оскаливается в улыбке."

/decl/emote/visible/shrug
	key = "shrug"
	emote_message_3p = "USER пожимает плечами."

/decl/emote/visible/smile
	key = "smile"
	emote_message_3p = "USER улыбается."

/decl/emote/visible/pale
	key = "pale"
	emote_message_3p = "USER становится бледным на секунду."

/decl/emote/visible/tremble
	key = "tremble"
	emote_message_3p = "USER трепещет в страхе!"

/decl/emote/visible/wink
	key = "wink"
	emote_message_3p = "USER подмигивает."

/decl/emote/visible/hug
	key = "hug"
	check_restraints = TRUE
	emote_message_3p = "USER обнимает USER_THEMself."
	emote_message_3p_target = "USER обнимает TARGET."

/decl/emote/visible/dap
	key = "dap"
	check_restraints = TRUE
	emote_message_3p = "USER к сожалению не смог найти никого кому мог бы дать пять, поэтому дал пять самому себе."
	emote_message_3p_target = "USER дал пять TARGET."

/decl/emote/visible/signal
	key = "signal"
	check_restraints = TRUE
	emote_message_3p = "USER сигнализирует."

/decl/emote/visible/signal/check_user(atom/user)
	return ismob(user)

/decl/emote/visible/bounce
	key = "bounce"
	emote_message_3p = "USER подпрыгивает на месте."

/decl/emote/visible/jiggle
	key = "jiggle"
	emote_message_3p = "USER покачивается!"

/decl/emote/visible/lightup
	key = "light"
	emote_message_3p = "USER загорается ненадолго, затем останавливается."

/decl/emote/visible/vibrate
	key = "vibrate"
	emote_message_3p = "USER вибрирует!"

/decl/emote/visible/deathgasp_robot
	key = "deathgasp"
	emote_message_3p = "USER на мгновение сильно вздрагивает, затем становится неподвижным, его глаза медленно темнеют."

/decl/emote/visible/handshake
	key = "handshake"
	check_restraints = TRUE
	emote_message_3p = "USER жмёт руки с самим собой."
	emote_message_3p_target = "USER пожимает руку с TARGET."
	message_type = VISIBLE_MESSAGE

/decl/emote/visible/handshake/get_emote_message_3p(atom/user, atom/target, extra_params)
	if(target && !user.Adjacent(target))
		return "USER протягивает USER_HIS руку к TARGET."
	return ..()

/decl/emote/visible/signal
	key = "signal"
	emote_message_3p = "USER сигнализирует."
	emote_message_3p_target = "USER сигнализирует на TARGET."
	message_type = VISIBLE_MESSAGE

/decl/emote/visible/signal/get_emote_message_3p(mob/user, atom/target, extra_params)
	if(istype(user) && !(user.r_hand && user.l_hand))
		var/t1 = round(text2num(extra_params))
		if(isnum(t1) && t1 <= 5)
			return "USER показывает [t1] пальцев."
	return .. ()

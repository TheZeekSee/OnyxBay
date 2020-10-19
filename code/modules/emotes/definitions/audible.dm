/decl/emote/audible
	key = "burp"
	emote_message_3p = "USER burps."
	message_type = AUDIBLE_MESSAGE

/*
/decl/emote/audible/do_extra(atom/user)
	if(emote_sound)
		playsound(user.loc, emote_sound, 50, 0)
*/

/decl/emote/audible/deathgasp_alien
	key = "deathgasp"
	emote_message_3p = "USER lets out a waning guttural screech, green blood bubbling from its maw."

/decl/emote/audible/whimper
	key ="whimper"
	emote_message_3p = "USER whimpers."

/decl/emote/audible/gasp
	key ="gasp"
	emote_message_3p = "USER задыхается."
	conscious = 0
	emote_sound = list(
		MALE = list(
			'sound/voice/gasp_male1.ogg', 'sound/voice/gasp_male2.ogg',
			'sound/voice/gasp_male3.ogg', 'sound/voice/gasp_male4.ogg',
			'sound/voice/gasp_male5.ogg', 'sound/voice/gasp_male6.ogg',
			'sound/voice/gasp_male7.ogg'),
		FEMALE = list(
			'sound/voice/gasp_female1.ogg', 'sound/voice/gasp_female2.ogg',
			'sound/voice/gasp_female3.ogg', 'sound/voice/gasp_female4.ogg',
			'sound/voice/gasp_female5.ogg', 'sound/voice/gasp_female6.ogg',
			'sound/voice/gasp_female7.ogg'))
	sounded_species = list(SPECIES_HUMAN, SPECIES_UNATHI, SPECIES_TAJARA, SPECIES_VOX, SPECIES_SKRELL)

/decl/emote/audible/scretch
	key ="scretch"
	emote_message_3p = "USER scretches."

/decl/emote/audible/choke
	key ="choke"
	emote_message_3p = "USER chokes."
	conscious = 0

/decl/emote/audible/gnarl
	key ="gnarl"
	emote_message_3p = "USER gnarls and shows its teeth.."

/decl/emote/audible/chirp
	key ="chirp"
	emote_message_3p = "USER chirps!"
	emote_sound = 'sound/misc/nymphchirp.ogg'

/decl/emote/audible/alarm
	key = "alarm"
	emote_message_1p = "You sound an alarm."
	emote_message_3p = "USER sounds an alarm."

/decl/emote/audible/alert
	key = "alert"
	emote_message_1p = "You let out a distressed noise."
	emote_message_3p = "USER lets out a distressed noise."

/decl/emote/audible/notice
	key = "notice"
	emote_message_1p = "You play a loud tone."
	emote_message_3p = "USER plays a loud tone."

/decl/emote/audible/whistle
	key = "whistle"
	emote_message_1p = "Вы свистите."
	emote_message_3p = "USER свистит."
	emote_sound = 'sound/voice/whistle.ogg'
	sounded_species = list(SPECIES_HUMAN, SPECIES_UNATHI, SPECIES_TAJARA, SPECIES_VOX, SPECIES_IPC, SPECIES_SKRELL)

/decl/emote/audible/boop
	key = "boop"
	emote_message_1p = "You boop."
	emote_message_3p = "USER boops."

/decl/emote/audible/sneeze
	key = "sneeze"
	emote_message_3p = "USER сморкается."
	emote_sound = list(
		MALE = list('sound/voice/sneeze_male_1.ogg', 'sound/voice/sneeze_male_2.ogg'),
		FEMALE = list('sound/voice/sneeze_female_1.ogg', 'sound/voice/sneeze_female_2.ogg'))
	sounded_species = list(SPECIES_HUMAN, SPECIES_UNATHI, SPECIES_TAJARA, SPECIES_SKRELL)

/decl/emote/audible/sniff
	key = "sniff"
	emote_message_3p = "USER sniffs."

/decl/emote/audible/snore
	key = "snore"
	emote_message_3p = "USER храпит."
	conscious = 0
	emote_sound = list(
		'sound/voice/snore_1.ogg', 'sound/voice/snore_2.ogg',
		'sound/voice/snore_3.ogg', 'sound/voice/snore_4.ogg',
		'sound/voice/snore_5.ogg', 'sound/voice/snore_6.ogg',
		'sound/voice/snore_7.ogg')
	sounded_species = list(SPECIES_HUMAN, SPECIES_UNATHI, SPECIES_TAJARA, SPECIES_VOX, SPECIES_SKRELL)

/decl/emote/audible/whimper
	key = "whimper"
	emote_message_3p = "USER whimpers."

/decl/emote/audible/yawn
	key = "yawn"
	emote_message_3p = "USER зевает."
	emote_sound = list(
		MALE = list('sound/voice/yawn_male_1.ogg', 'sound/voice/yawn_male_2.ogg'),
		FEMALE = list('sound/voice/yawn_female_1.ogg', 'sound/voice/yawn_female_2.ogg',
						'sound/voice/yawn_female_3.ogg'))
	sounded_species = list(SPECIES_HUMAN, SPECIES_UNATHI, SPECIES_TAJARA, SPECIES_SKRELL)

/decl/emote/audible/clap
	key = "clap"
	emote_message_3p = "USER хлопает."
	emote_sound = 'sound/voice/clap.ogg'

/decl/emote/audible/chuckle
	key = "chuckle"
	emote_message_3p = "USER chuckles."

/decl/emote/audible/cough
	key = "cough"
	emote_message_3p = "USER кашляет!"
	conscious = 0
	emote_sound = list(
		MALE = 'sound/voice/cough_male.ogg',
		FEMALE = 'sound/voice/cough_female.ogg')
	sounded_species = list(SPECIES_HUMAN, SPECIES_UNATHI, SPECIES_TAJARA, SPECIES_VOX, SPECIES_SKRELL)

/decl/emote/audible/cry
	key = "cry"
	emote_message_3p = "USER плачет."
	emote_sound = list(
		MALE = list('sound/voice/cry_male_1.ogg', 'sound/voice/cry_male_2.ogg'),
		FEMALE = list('sound/voice/cry_female_1.ogg', 'sound/voice/cry_female_2.ogg',
						'sound/voice/cry_female_3.ogg'))
	sounded_species = list(SPECIES_HUMAN, SPECIES_UNATHI, SPECIES_TAJARA, SPECIES_SKRELL)

/decl/emote/audible/sigh
	key = "sigh"
	emote_message_3p = "USER вздыхает."
	emote_sound = list(
		MALE = 'sound/voice/sigh_male.ogg',
		FEMALE = 'sound/voice/sigh_female.ogg')
	sounded_species = list(SPECIES_HUMAN, SPECIES_UNATHI, SPECIES_TAJARA, SPECIES_VOX, SPECIES_SKRELL)

/decl/emote/audible/laugh
	key = "laugh"
	emote_message_3p = "USER смеётся."
	emote_sound = list(
		MALE = 'sound/voice/laugh_male_1.ogg',
		FEMALE = 'sound/voice/laugh_female_2.ogg')
	sounded_species = list(SPECIES_HUMAN, SPECIES_UNATHI, SPECIES_TAJARA, SPECIES_SKRELL)

/decl/emote/audible/mumble
	key = "mumble"
	emote_message_3p = "USER мямлет!"

/decl/emote/audible/grumble
	key = "grumble"
	emote_message_3p = "USER grumbles!"

/decl/emote/audible/groan
	key = "groan"
	emote_message_3p = "USER groans!"
	conscious = 0

/decl/emote/audible/moan
	key = "moan"
	emote_message_3p = "USER стонет!"
	conscious = 0

/decl/emote/audible/giggle
	key = "giggle"
	emote_message_3p = "USER giggle."
	emote_sound = list(
		MALE = 'sound/voice/giggle_male_2.ogg',
		FEMALE = 'sound/voice/giggle_female_3.ogg')
	sounded_species = list(SPECIES_HUMAN, SPECIES_UNATHI, SPECIES_TAJARA, SPECIES_SKRELL)

/decl/emote/audible/scream
	key = "scream"
	emote_message_3p = "USER кричит!"
	emote_sound = list(
		MALE = list('sound/voice/scream_male_1.ogg', 'sound/voice/scream_male_2.ogg',
					'sound/voice/scream_male_3.ogg'),
		FEMALE = list('sound/voice/scream_female_1.ogg', 'sound/voice/scream_female_2.ogg'))
	sounded_species = list(SPECIES_HUMAN, SPECIES_UNATHI, SPECIES_TAJARA, SPECIES_SKRELL)

/decl/emote/audible/grunt
	key = "grunt"
	emote_message_3p = "USER grunts."

/decl/emote/audible/bug_hiss
	key ="hiss"
	emote_message_3p = "USER шипит."
	emote_sound = 'sound/voice/BugHiss.ogg'

/decl/emote/audible/bug_buzz
	key ="buzz"
	emote_message_3p = "USER buzzes its wings."
	emote_sound = 'sound/voice/BugBuzz.ogg'

/decl/emote/audible/bug_chitter
	key ="chitter"
	emote_message_3p = "USER chitters."
	emote_sound = 'sound/voice/Bug.ogg'

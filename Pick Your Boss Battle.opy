settings {
	"main": {
		"description": "A silly game where 6 players must pick 1 person to be the Boss. The Boss picks Perks and Heroes pick Boons, which upgrade each side respectively. Perks and Boons contribute to a Wager, which is a rough way to gauge the difficulty of the match-up. Aim for relatively even wagers for the best competition, or go wild and see how crazy it can get! The choice is yours!",
		"modeName": "Pick Your Boss"
	},
	"lobby": {
		"enableMatchVoiceChat": true,
		"team1Slots": 6,
		"team2Slots": 6,
		"swapTeamsAfterMatch": false
	},
	"gamemodes": {
		"control": {
			"scoreToWin": 2
		},
		"escort": {},
		"hybrid": {},
		"general": {
			"gamemodeStartTrigger": "immediately",
			"roleLimit": "1Tank2Offense2Support",
			# Kill cams block the UI for self-resurrect
			"enableKillCam": false,
		}
	},
	"heroes": {
		"allTeams": {
			"zarya": {
				"ability1Cooldown%": 80,
				"ability2Cooldown%": 80
			}
		}
    }
}

#Global variables

globalvar Iterator
globalvar Sum
globalvar PlayerVotes
globalvar PerksToPick
globalvar PerksPicked
globalvar PerkLimits
globalvar PerkStrings
globalvar PerkTexts
globalvar BoonsToPick
globalvar BoonsPicked
globalvar BoonLimits
globalvar BoonStrings
globalvar BoonTexts
globalvar TeamBoss
globalvar TeamHeroes
globalvar WagerBoss
globalvar WagerHeroes
globalvar WagerString
globalvar PickingBoss
globalvar PickingPerks
globalvar DonePicking
globalvar PickedBoss
globalvar Timer
globalvar InstructionText
globalvar ObjectivePosition
globalvar PayloadBicth
globalvar PayloadBicthSpawnTimer

#!define PerkUltCharge PerksPicked[0]
#!define PerkHealthAddition PerksPicked[1]
#!define PerkArmorAddition PerksPicked[2]
#!define PerkShieldAddition PerksPicked[3]
#!define PerkDamageReduction PerksPicked[4]
#!define PerkDamageDealt PerksPicked[5]
#!define PerkCooldownReduction PerksPicked[6]
#!define PerkHealthRegen PerksPicked[7]
#!define PerkMoveSpeed PerksPicked[8]
#!define PerkKnockback PerksPicked[9]
#!define PerkHealingReceived PerksPicked[10]
#!define PerkFireDamage PerksPicked[11]
#!define PerkShrink PerksPicked[12]
#!define PerkKnockbackImmunity PerksPicked[13]
#!define PerkProjectileSpeed PerksPicked[14]
#!define PerkPayloadBicth PerksPicked[15]
#!define PerkEliminationHeal PerksPicked[16]

#!define PerkStringUltCharge PerkStrings[0]
#!define PerkStringHealthAddition PerkStrings[1]
#!define PerkStringArmorAddition PerkStrings[2]
#!define PerkStringShieldAddition PerkStrings[3]
#!define PerkStringDamageReduction PerkStrings[4]
#!define PerkStringDamageDealt PerkStrings[5]
#!define PerkStringCooldownReduction PerkStrings[6]
#!define PerkStringHealthRegen PerkStrings[7]
#!define PerkStringMoveSpeed PerkStrings[8]
#!define PerkStringKnockback PerkStrings[9]
#!define PerkStringHealingReceived PerkStrings[10]
#!define PerkStringFireDamage PerkStrings[11]
#!define StringScale PerkStrings[12]
#!define PerkStringProjectileSpeed PerkStrings[14]
#!define PerkStringEliminationHeal PerkStrings[16]

#!define PerkTextUltCharge PerkTexts[0]
#!define PerkTextHealthAddition PerkTexts[1]
#!define PerkTextArmorAddition PerkTexts[2]
#!define PerkTextShieldAddition PerkTexts[3]
#!define PerkTextDamageReduction PerkTexts[4]
#!define PerkTextDamageDealt PerkTexts[5]
#!define PerkTextCooldownReduction PerkTexts[6]
#!define PerkTextHealthRegen PerkTexts[7]
#!define PerkTextMoveSpeed PerkTexts[8]
#!define PerkTextKnockback PerkTexts[9]
#!define PerkTextHealingReceived PerkTexts[10]
#!define PerkTextFireDamage PerkTexts[11]
#!define TextScale PerkTexts[12]
#!define PerkTextKnockbackImmunity PerkTexts[13]
#!define PerkTextProjectileSpeed PerkTexts[14]
#!define PerkTextPayloadBicth PerkTexts[15]
#!define PerkTextEliminationHeal PerkTexts[16]

#!define LAST_PERK_INDEX 16

#!define BoonUltCharge BoonsPicked[0]
#!define BoonSelfResurrect BoonsPicked[1]
#!define BoonInvisibility BoonsPicked[2]
#!define BoonTankHealth BoonsPicked[3]
#!define BoonDamageDamage BoonsPicked[4]
#!define BoonSupportMoveSpeed BoonsPicked[5]
#!define BoonHealthAbsorption BoonsPicked[6]
#!define BoonBossBigger BoonsPicked[7]

#!define BoonStringUltCharge BoonStrings[0]
#!define BoonStringSelfResurrect BoonStrings[1]
#!define BoonStringInvisibility BoonStrings[2]
#!define BoonStringTankHealth BoonStrings[3]
#!define BoonStringDamageDamage BoonStrings[4]
#!define BoonStringSupportMoveSpeed BoonStrings[5]
#!define BoonStringHealthAbsorption BoonStrings[6]

#!define BoonTextUltCharge BoonTexts[0]
#!define BoonTextSelfResurrect BoonTexts[1]
#!define BoonTextInvisibility BoonTexts[2]
#!define BoonTextTankHealth BoonTexts[3]
#!define BoonTextDamageDamage BoonTexts[4]
#!define BoonTextSupportMoveSpeed BoonTexts[5]
#!define BoonTextHealthAbsorption BoonTexts[6]

#!define LAST_BOON_INDEX 7

#!define ULT_CHARGE_MULT 2.0
#!define HEALTH_ADD_MULT 2.0
#!define ARMOR_ADD_MULT 1.75
#!define SHIELD_ADD_MULT 1.5
#!define DAMAGE_RECEIVE_MULT 0.7
#!define DAMAGE_DEALT_MULT 1.3
#!define COOLDOWN_MULT 0.5
#!define REGEN_RATE 15
#!define MOVE_SPEED_MULT 1.3
#!define KNOCKBACK_MULT 2.5
#!define HEALING_RECEIVED_MULT 2.0
#!define FIRE_DAMAGE_MULT 0.5
#!define FIRE_DAMAGE_DURATION 3
#!define SHRINK_MULT 0.8
#!define PROJECTILE_SPEED_MULT 2.0
#!define PAYLOAD_BITCH_COOLDOWN 30
#!define ELIMINATION_HEALING 250

#!define BOON_ULT_CHARGE_MULT 2.0
#!define BOON_SELF_RESURRECTS_COUNT 3
#!define BOON_INVIS_CHARGE_SECONDS 3.0
#!define BOON_TANK_HEALTH_MULT 1.8
#!define BOON_DAMAGE_DAMAGE_MULT 1.3
#!define BOON_SUPPORT_MOVE_SPEED_MULT 1.3
#!define BOON_HEALTH_ABSORB_MULT 0.25
#!define BOON_BOSS_SIZE_MULT 1.15

#!define BLINK_COOLDOWN 3
#!define CONCUSSION_MINE_COOLDOWN 8
#!define ZARYA_BUBBLE_COOLDOWN 11
#!define FIRESTRIKE_COOLDOWN 6
#!define SYM_TURRET_COOLDOWN 10

#!define BOSS_PICKING_TIME 30
#!define PERK_PICKING_TIME 90


#Player variables

playervar Iterator
playervar Texts
playervar Picked
playervar PlayersToPick
playervar VotesToBecomeBoss
playervar PrevUltCharge
playervar PrevHero
playervar RecallHealth
playervar RecallHealthIndex
playervar InvisibilityTimer

def addRandomPerk():
	PerksPicked[random.randint(0, LAST_PERK_INDEX)] += 1



def uStringScale():
	StringScale = "Boss Scale: {0}%".format(100 * SHRINK_MULT ** PerkShrink * BOON_BOSS_SIZE_MULT ** BoonBossBigger)



def uPerkStringUltCharge():
	PerkStringUltCharge = "Ultimate Charge Rate: {0}%".format(100 * (ULT_CHARGE_MULT ** PerkUltCharge))

def uPerkStringHealthAddition():
	PerkStringHealthAddition = "Health Multiplier: {0}%".format(100 * (HEALTH_ADD_MULT ** PerkHealthAddition))

def uPerkStringArmorAddition():
	PerkStringArmorAddition = "Added Armor: {0}%".format(100 * (-1 + ARMOR_ADD_MULT ** PerkArmorAddition))

def uPerkStringShieldAddition():
	PerkStringShieldAddition = "Added Shields: {0}%".format(100 * (-1 + SHIELD_ADD_MULT ** PerkShieldAddition))

def uPerkStringDamageReduction():
	PerkStringDamageReduction = "Damage Reduction: {0}%".format(100 * (1 - DAMAGE_RECEIVE_MULT**PerkDamageReduction))

def uPerkStringDamageDealt():
	PerkStringDamageDealt = "Damage Dealt: {0}%".format(100 * DAMAGE_DEALT_MULT**PerkDamageDealt)

def uPerkStringCooldowns():
	PerkStringCooldownReduction = "Cooldowns: {0}%".format(100 * COOLDOWN_MULT**PerkCooldownReduction)

def uPerkStringHealthRegen():
	PerkStringHealthRegen = "Health Regen: {0}hp/s".format(REGEN_RATE * PerkHealthRegen * HEALING_RECEIVED_MULT ** PerkHealingReceived)

def uPerkStringMoveSpeed():
	PerkStringMoveSpeed = "Move Speed: {0}%".format(100 * MOVE_SPEED_MULT ** PerkMoveSpeed)

def uPerkStringKnockback():
	PerkStringKnockback = "Knockback: {0}%".format(100 * KNOCKBACK_MULT ** PerkKnockback)

def uPerkStringHealingReceived():
	PerkStringHealingReceived = "Healing Received: {0}%".format(100 * HEALING_RECEIVED_MULT ** PerkHealingReceived)
	uPerkStringHealthRegen()

def uPerkStringFireDamage():
	PerkStringFireDamage = "Fire Damage: {0}%".format(100 * (-1 + (1+FIRE_DAMAGE_MULT) ** PerkFireDamage))

def uPerkStringProjSpeed():
	PerkStringProjectileSpeed = "Projectile Speed: {0}%".format(100 * (PROJECTILE_SPEED_MULT ** PerkProjectileSpeed))

def uPerkStringEliminationHeal():
	PerkStringEliminationHeal = "Heal {0}hp on Elim".format(ELIMINATION_HEALING * PerkEliminationHeal)



def uBoonStringUltCharge():
	BoonStringUltCharge = "Ultimate Charge Rate: {0}%".format(100 * (BOON_ULT_CHARGE_MULT ** BoonUltCharge))

def uBoonStringSelfResurrect():
	BoonStringSelfResurrect = "Resurrects Available: {0}".format(BOON_SELF_RESURRECTS_COUNT * BoonSelfResurrect)

def uBoonStringInvisibility():
	BoonStringInvisibility = "Invisibility in {0}s".format(BOON_INVIS_CHARGE_SECONDS)

def uBoonStringTankHealth():
	BoonStringTankHealth = "Tank Health: {0}%".format(100 * (BOON_TANK_HEALTH_MULT ** BoonTankHealth))

def uBoonStringDamageDamage():
	BoonStringDamageDamage = "Damage Hero Damage: {0}%".format(100 * (BOON_DAMAGE_DAMAGE_MULT ** BoonDamageDamage))

def uBoonStringSupportMoveSpeed():
	BoonStringSupportMoveSpeed = "Support Move Speed: {0}%".format(100 * (BOON_SUPPORT_MOVE_SPEED_MULT ** BoonSupportMoveSpeed))

def uBoonStringHealthAbsorption():
	BoonStringHealthAbsorption = "Health Absorption: {0}%".format(100 * BOON_HEALTH_ABSORB_MULT * BoonHealthAbsorption)



def uWager():
	WagerHeroes = 200 * (getNumberOfPlayers(Team.ALL) - 2)
	Sum = 0
	for Iterator in range(len(BoonsPicked)):
		Sum += BoonsPicked[Iterator]
		# WagerHeroes += 25 * BoonsPicked[Iterator] * (getNumberOfPlayers(Team.ALL) - 1)
	WagerHeroes += 100 * (1.2 ** Sum - 1) * (getNumberOfPlayers(Team.ALL) - 1)
	WagerBoss = 0
	Sum = 0
	for Iterator in range(len(PerksPicked)):
		Sum += PerksPicked[Iterator]
		# WagerBoss += 100 * PerksPicked[Iterator]
	WagerBoss += 100 * (1.4 ** Sum - 1)
	WagerString = "Wager\nBoss {0} | {1} Heroes".format(ceil(WagerBoss/50)*50, ceil(WagerHeroes/50)*50)



rule "Init Global Variables":
	PlayerVotes = 0
	TeamBoss = random.choice([Team.1, Team.2])
	TeamHeroes = getOppositeTeam(TeamBoss)
	PickingBoss = true
	PickingPerks = false
	DonePicking = false
	PickedBoss = null
	Timer = 0
	PayloadBicthSpawnTimer = PAYLOAD_BITCH_COOLDOWN
	PerksToPick = [
		"Ultimate Charge\nRate +100%",
		"Health\n+100%",
		"Armor\n+75%",
		"Shields\n+50%",
		"Damage Taken\n-30%",
		"Damage Dealt\n+30%",
		"Cooldowns\n-50%",
		"Regen\n15hp/s",
		"Move Speed\n+30%",
		"Knockback Dealt\n+150%",
		"Healing Received\n+100%",
		"Fire Damage\n+50%",
		"Scale\n-20%",
		"Knockback Immunity",
		"Projectile Speed\n+100%",
		"Payload Bitch\nwith 30s respawns",
		"Upon Elim\nHeal 250hp",
	]
	PerkLimits = [
		1, # ult rate
		2, # health
		2, # armor
		2, # shields
		2, # damage reduction
		3, # damage dealt
		2, # cooldowns
		2, # regen
		3, # move speed
		1, # knockback
		1, # healing received
		1, # fire damage
		1, # shrink
		1, # knockback immunity
		1, # projectile speed
		1, # payload bitch
		1, # elim heal
	]
	PerksPicked = [0 for a in PerksToPick]
	PerkStrings = ["" for a in PerksToPick]
	BoonsToPick = [
		"Ultimate Charge\nRate +100%",
		"+3 Self-Resurrect\nAvailable to Team",
		"Invisibility\nupon 3s of no shooting\nand slow movement",
		"Tank Heroes\nHealth +80%",
		"Damage Heroes\nDamage Dealt +30%",
		"Support Heroes\nMove Speed +30%",
		"Health Absorption\n+25%",
		"Boss Scale\n+15%",
	]
	BoonLimits = [
		2, # ult rate
		3, # self-rez
		1, # invisibility
		3, # tank health
		3, # damage damage
		2, # support move speed
		3, # health absorption
		3, # boss scale
	]
	BoonsPicked = [0 for a in BoonsToPick]
	BoonTexts = ["" for a in BoonsToPick]
	chase(Timer, 0, rate=1, ChaseReeval.NONE)



rule "Wager HUD":
	@Condition PickingPerks
	
	uWager()
	hudSubtext(getAllPlayers(),
		WagerString,
		HudPosition.LEFT, 10, Color.PURPLE, HudReeval.STRING, SpecVisibility.DEFAULT
	)



rule "Scale HUD":
	@Condition PerkShrink > 0 or BoonBossBigger > 0
	
	hudSubtext(getAllPlayers(),
		StringScale,
		HudPosition.RIGHT, 1, Color.RED if (SHRINK_MULT ** PerkShrink * BOON_BOSS_SIZE_MULT ** BoonBossBigger) < 1 else Color.LIME_GREEN, HudReeval.STRING_AND_COLOR, SpecVisibility.ALWAYS
	)
	TextScale = getLastCreatedText()
	waitUntil(PerkShrink == 0 and BoonBossBigger == 0, 99999)
	destroyHudText(TextScale)



rule "Ult Charge Boon HUD":
	@Condition BoonUltCharge > 0
	
	hudSubtext(getAllPlayers(),
		BoonStringUltCharge,
		HudPosition.RIGHT, 1, Color.LIME_GREEN, HudReeval.STRING, SpecVisibility.ALWAYS
	)
	BoonTextUltCharge = getLastCreatedText()
	waitUntil(BoonUltCharge == 0, 99999)
	destroyHudText(BoonTextUltCharge)

rule "Self Resurrect Boon HUD":
	@Condition BoonSelfResurrect > 0
	
	hudSubtext(getAllPlayers(),
		BoonStringSelfResurrect,
		HudPosition.RIGHT, 1, Color.LIME_GREEN, HudReeval.STRING, SpecVisibility.ALWAYS
	)
	BoonTextSelfResurrect = getLastCreatedText()
	waitUntil(BoonSelfResurrect == 0, 99999)
	destroyHudText(BoonTextSelfResurrect)

rule "Invisibility Boon HUD":
	@Condition BoonInvisibility > 0
	
	hudSubtext(getAllPlayers(),
		BoonStringInvisibility,
		HudPosition.RIGHT, 1, Color.LIME_GREEN, HudReeval.STRING, SpecVisibility.ALWAYS
	)
	BoonTextInvisibility = getLastCreatedText()
	waitUntil(BoonInvisibility == 0, 99999)
	destroyHudText(BoonTextInvisibility)

rule "Gigatank Boon HUD":
	@Condition BoonTankHealth > 0
	
	hudSubtext(getAllPlayers(),
		BoonStringTankHealth,
		HudPosition.RIGHT, 1, Color.LIME_GREEN, HudReeval.STRING, SpecVisibility.ALWAYS
	)
	BoonTextTankHealth = getLastCreatedText()
	waitUntil(BoonTankHealth == 0, 99999)
	destroyHudText(BoonTextTankHealth)

rule "Damage Damage Boon HUD":
	@Condition BoonDamageDamage > 0
	
	hudSubtext(getAllPlayers(),
		BoonStringDamageDamage,
		HudPosition.RIGHT, 1, Color.LIME_GREEN, HudReeval.STRING, SpecVisibility.ALWAYS
	)
	BoonTextDamageDamage = getLastCreatedText()
	waitUntil(BoonDamageDamage == 0, 99999)
	destroyHudText(BoonTextDamageDamage)

rule "Support Move Speed Boon HUD":
	@Condition BoonSupportMoveSpeed > 0
	
	hudSubtext(getAllPlayers(),
		BoonStringSupportMoveSpeed,
		HudPosition.RIGHT, 1, Color.LIME_GREEN, HudReeval.STRING, SpecVisibility.ALWAYS
	)
	BoonTextSupportMoveSpeed = getLastCreatedText()
	waitUntil(BoonSupportMoveSpeed == 0, 99999)
	destroyHudText(BoonTextSupportMoveSpeed)

rule "Health Absorption Boon HUD":
	@Condition BoonHealthAbsorption > 0
	
	hudSubtext(getAllPlayers(),
		BoonStringHealthAbsorption,
		HudPosition.RIGHT, 1, Color.LIME_GREEN, HudReeval.STRING, SpecVisibility.ALWAYS
	)
	BoonTextHealthAbsorption = getLastCreatedText()
	waitUntil(BoonHealthAbsorption == 0, 99999)
	destroyHudText(BoonTextHealthAbsorption)



rule "Ult Charge Perk HUD":
	@Condition PerkUltCharge > 0
	
	hudSubtext(getAllPlayers(),
		PerkStringUltCharge,
		HudPosition.RIGHT, 0, Color.RED, HudReeval.STRING, SpecVisibility.ALWAYS
	)
	PerkTextUltCharge = getLastCreatedText()
	waitUntil(PerkUltCharge == 0, 99999)
	destroyHudText(PerkTextUltCharge)

rule "Health Addition Perk HUD":
	@Condition PerkHealthAddition > 0
	
	hudSubtext(getAllPlayers(),
		PerkStringHealthAddition,
		HudPosition.RIGHT, 0, Color.RED, HudReeval.STRING, SpecVisibility.ALWAYS
	)
	PerkTextHealthAddition = getLastCreatedText()
	waitUntil(PerkHealthAddition == 0, 99999)
	destroyHudText(PerkTextHealthAddition)

rule "PerkArmorAddition HUD":
	@Condition PerkArmorAddition > 0
	
	hudSubtext(getAllPlayers(),
		PerkStringArmorAddition,
		HudPosition.RIGHT, 0, Color.RED, HudReeval.STRING, SpecVisibility.ALWAYS
	)
	PerkTextArmorAddition = getLastCreatedText()
	waitUntil(PerkArmorAddition == 0, 99999)
	destroyHudText(PerkTextArmorAddition)

rule "PerkShieldAddition HUD":
	@Condition PerkShieldAddition > 0
	
	hudSubtext(getAllPlayers(),
		PerkStringShieldAddition,
		HudPosition.RIGHT, 0, Color.RED, HudReeval.STRING, SpecVisibility.ALWAYS
	)
	PerkTextShieldAddition = getLastCreatedText()
	waitUntil(PerkShieldAddition == 0, 99999)
	destroyHudText(PerkTextShieldAddition)

rule "PerkDamageReduction HUD":
	@Condition PerkDamageReduction > 0
	
	hudSubtext(getAllPlayers(),
		PerkStringDamageReduction,
		HudPosition.RIGHT, 0, Color.RED, HudReeval.STRING, SpecVisibility.ALWAYS
	)
	PerkTextDamageReduction = getLastCreatedText()
	waitUntil(PerkDamageReduction == 0, 99999)
	destroyHudText(PerkTextDamageReduction)

rule "PerkDamageDealt HUD":
	@Condition PerkDamageDealt > 0
	
	hudSubtext(getAllPlayers(),
		PerkStringDamageDealt,
		HudPosition.RIGHT, 0, Color.RED, HudReeval.STRING, SpecVisibility.ALWAYS
	)
	PerkTextDamageDealt = getLastCreatedText()
	waitUntil(PerkDamageDealt == 0, 99999)
	destroyHudText(PerkTextDamageDealt)

rule "PerkCooldownReduction HUD":
	@Condition PerkCooldownReduction > 0
	
	hudSubtext(getAllPlayers(),
		PerkStringCooldownReduction,
		HudPosition.RIGHT, 0, Color.RED, HudReeval.STRING, SpecVisibility.ALWAYS
	)
	PerkTextCooldownReduction = getLastCreatedText()
	waitUntil(PerkCooldownReduction == 0, 99999)
	destroyHudText(PerkTextCooldownReduction)

rule "PerkHealthRegen HUD":
	@Condition PerkHealthRegen > 0
	
	hudSubtext(getAllPlayers(),
		PerkStringHealthRegen,
		HudPosition.RIGHT, 0, Color.RED, HudReeval.STRING, SpecVisibility.ALWAYS
	)
	PerkTextHealthRegen = getLastCreatedText()
	waitUntil(PerkHealthRegen == 0, 99999)
	destroyHudText(PerkTextHealthRegen)

rule "PerkMoveSpeed HUD":
	@Condition PerkMoveSpeed > 0
	
	hudSubtext(getAllPlayers(),
		PerkStringMoveSpeed,
		HudPosition.RIGHT, 0, Color.RED, HudReeval.STRING, SpecVisibility.ALWAYS
	)
	PerkTextMoveSpeed = getLastCreatedText()
	waitUntil(PerkMoveSpeed == 0, 99999)
	destroyHudText(PerkTextMoveSpeed)

rule "PerkKnockback HUD":
	@Condition PerkKnockback > 0
	
	hudSubtext(getAllPlayers(),
		PerkStringKnockback,
		HudPosition.RIGHT, 0, Color.RED, HudReeval.STRING, SpecVisibility.ALWAYS
	)
	PerkTextKnockback = getLastCreatedText()
	waitUntil(PerkKnockback == 0, 99999)
	destroyHudText(PerkTextKnockback)

rule "PerkHealingReceived HUD":
	@Condition PerkHealingReceived > 0
	
	hudSubtext(getAllPlayers(),
		PerkStringHealingReceived,
		HudPosition.RIGHT, 0, Color.RED, HudReeval.STRING, SpecVisibility.ALWAYS
	)
	PerkTextHealingReceived = getLastCreatedText()
	waitUntil(PerkHealingReceived == 0, 99999)
	destroyHudText(PerkTextHealingReceived)

rule "PerkFireDamage HUD":
	@Condition PerkFireDamage > 0
	
	hudSubtext(getAllPlayers(),
		PerkStringFireDamage,
		HudPosition.RIGHT, 0, Color.RED, HudReeval.STRING, SpecVisibility.ALWAYS
	)
	PerkTextFireDamage = getLastCreatedText()
	waitUntil(PerkFireDamage == 0, 99999)
	destroyHudText(PerkTextFireDamage)

rule "PerkKnockbackImmunity HUD":
	@Condition PerkKnockbackImmunity > 0
	
	hudSubtext(getAllPlayers(),
		"Knockback Immunity",
		HudPosition.RIGHT, 0, Color.RED, HudReeval.NONE, SpecVisibility.ALWAYS
	)
	PerkTextKnockbackImmunity = getLastCreatedText()
	waitUntil(PerkKnockbackImmunity == 0, 99999)
	destroyHudText(PerkTextKnockbackImmunity)

rule "PerkProjectileSpeed HUD":
	@Condition PerkProjectileSpeed > 0
	
	hudSubtext(getAllPlayers(),
		PerkStringProjectileSpeed,
		HudPosition.RIGHT, 0, Color.RED, HudReeval.STRING, SpecVisibility.ALWAYS
	)
	PerkTextProjectileSpeed = getLastCreatedText()
	waitUntil(PerkProjectileSpeed == 0, 99999)
	destroyHudText(PerkTextProjectileSpeed)

rule "PerkPayloadBicth HUD":
	@Condition PerkPayloadBicth > 0
	
	hudSubtext(getAllPlayers(),
		"Payload Bitch {0}s".format(ceil(PayloadBicthSpawnTimer)),
		HudPosition.RIGHT, 0, Color.RED, HudReeval.STRING, SpecVisibility.ALWAYS
	)
	PerkTextPayloadBicth = getLastCreatedText()
	waitUntil(PerkPayloadBicth == 0, 99999)
	destroyHudText(PerkTextPayloadBicth)

rule "PerkEliminationHeal HUD":
	@Condition PerkEliminationHeal > 0
	
	hudSubtext(getAllPlayers(),
		PerkStringEliminationHeal,
		HudPosition.RIGHT, 0, Color.RED, HudReeval.STRING, SpecVisibility.ALWAYS
	)
	PerkTextEliminationHeal = getLastCreatedText()
	waitUntil(PerkEliminationHeal == 0, 99999)
	destroyHudText(PerkTextEliminationHeal)



rule "Init Player Variables":
	@Event eachPlayer
	
	eventPlayer.VotesToBecomeBoss = 0
	eventPlayer.PrevUltCharge = 0
	eventPlayer.RecallHealth = []
	for eventPlayer.Iterator in range(180):
		eventPlayer.RecallHealth.append(150)
	eventPlayer.RecallHealthIndex = 0



rule "Boss Scale":
	@Event eachPlayer
	@Condition DonePicking == true
	@Condition PickedBoss == eventPlayer
	@Condition PerkShrink > 0 or BoonBossBigger > 0
	
	eventPlayer.startScalingSize(SHRINK_MULT ** PerkShrink * BOON_BOSS_SIZE_MULT ** BoonBossBigger, false)




rule "Ult Charge Boon":
	@Event eachPlayer
	@Condition DonePicking == true
	@Condition PickedBoss != eventPlayer
	@Condition BoonUltCharge > 0
	
	if eventPlayer.getUltCharge() > eventPlayer.PrevUltCharge+1:
		eventPlayer.setUltCharge(eventPlayer.getUltCharge() + max(0, (eventPlayer.getUltCharge()-eventPlayer.PrevUltCharge)) * BOON_ULT_CHARGE_MULT)
		eventPlayer.PrevUltCharge = eventPlayer.getUltCharge()
	wait(0.25)
	goto RULE_START

rule "Tank Health Boon":
	@Event eachPlayer
	@Condition DonePicking == true
	@Condition PickedBoss != eventPlayer
	@Condition eventPlayer.getCurrentHero() in getTankHeroes()
	@Condition BoonTankHealth > 0
	
	eventPlayer.removeAllHealthPools()
	eventPlayer.setMaxHealth(100 * BOON_TANK_HEALTH_MULT**BoonTankHealth)
	eventPlayer.setHealth(eventPlayer.getMaxHealth())
	waitUntil(eventPlayer.getCurrentHero() not in getTankHeroes(), 99999)
	eventPlayer.setMaxHealth(100)

rule "Damage hero Damage Dealt Boon":
	@Event eachPlayer
	@Condition DonePicking == true
	@Condition PickedBoss != eventPlayer
	@Condition eventPlayer.getCurrentHero() in getDamageHeroes()
	@Condition BoonDamageDamage > 0
	
	eventPlayer.setDamageDealt(100 * BOON_DAMAGE_DAMAGE_MULT ** BoonDamageDamage)
	waitUntil(eventPlayer.getCurrentHero() not in getDamageHeroes(), 99999)
	eventPlayer.setDamageDealt(100)

rule "Support Move Speed Boon":
	@Event eachPlayer
	@Condition DonePicking == true
	@Condition PickedBoss != eventPlayer
	@Condition eventPlayer.getCurrentHero() in getSupportHeroes()
	@Condition BoonSupportMoveSpeed > 0
	
	eventPlayer.setMoveSpeed(100 * BOON_SUPPORT_MOVE_SPEED_MULT ** BoonSupportMoveSpeed)
	waitUntil(eventPlayer.getCurrentHero() not in getSupportHeroes(), 99999)
	eventPlayer.setMoveSpeed(100)

rule "Self Resurrect Boon":
	@Event eachPlayer
	@Condition DonePicking == true
	@Condition PickedBoss != eventPlayer
	@Condition eventPlayer.isDead()
	@Condition BoonSelfResurrect > 0
	
	wait(5)
	hudText(eventPlayer, null, "Press {0} to Self-Resurrect".format(buttonString(Button.INTERACT)), null, HudPosition.TOP, 10, null, Color.YELLOW, null, HudReeval.NONE, SpecVisibility.DEFAULT)
	eventPlayer.Texts[0] = getLastCreatedText()
	waitUntil(eventPlayer.isHoldingButton(Button.INTERACT) or eventPlayer.isAlive(), 30)
	destroyHudText(eventPlayer.Texts[0])
	if eventPlayer.isDead() and eventPlayer.isHoldingButton(Button.INTERACT):
		eventPlayer.resurrect()
		BoonSelfResurrect -= 1
		uBoonStringSelfResurrect()

rule "Invisibility Boon Timer":
	@Event eachPlayer
	@Condition DonePicking == true
	@Condition PickedBoss != eventPlayer
	@Condition BoonInvisibility > 0
	
	eventPlayer.InvisibilityTimer = BOON_INVIS_CHARGE_SECONDS
	chase(eventPlayer.InvisibilityTimer, 0.0, rate=1.0, ChaseReeval.NONE)
	while true:
		if eventPlayer.getSpeed() > 5.0 or eventPlayer.isMeleeing() or eventPlayer.isFiringPrimaryFire() or (eventPlayer.isFiringSecondaryFire() and eventPlayer.getCurrentHero() not in [Hero.ANA, Hero.ASHE, Hero.BRIGITTE, Hero.HANZO, Hero.JUNKRAT, Hero.PHARAH, Hero.RAMATTRA, Hero.REAPER, Hero.REINHARDT, Hero.SIGMA, Hero.SOMBRA, Hero.WIDOWMAKER]):
			eventPlayer.InvisibilityTimer = 5
		wait(0.016)
	# hudSubtext(eventPlayer, "Speed: {0}".format(eventPlayer.getSpeed()), HudPosition.LEFT, 10, Color.BLACK, HudReeval.STRING, SpecVisibility.DEFAULT)

rule "Invisibility Boon Effect":
	@Event eachPlayer
	@Condition DonePicking == true
	@Condition PickedBoss != eventPlayer
	@Condition BoonInvisibility > 0
	@Condition eventPlayer.InvisibilityTimer == 0
	
	hudSubtext(eventPlayer, "INVISIBLE", HudPosition.TOP, 10, Color.RED, HudReeval.NONE, SpecVisibility.DEFAULT)
	eventPlayer.Texts[1] = getLastCreatedText()
	eventPlayer.setInvisibility(Invis.ENEMIES)
	waitUntil(eventPlayer.InvisibilityTimer > 0, 99999)
	destroyHudText(eventPlayer.Texts[1])
	eventPlayer.setInvisibility(Invis.NONE)
	bigMessage(eventPlayer, "REVEALED")

rule "Health Absorption Boon":
	@Event playerDealtDamage
	@Condition DonePicking == true
	@Condition PickedBoss != eventPlayer
	@Condition BoonHealthAbsorption > 0
	
	heal(eventPlayer, eventPlayer, eventDamage * BOON_HEALTH_ABSORB_MULT * BoonHealthAbsorption)



rule "Ult Charge Perk":
	@Event eachPlayer
	@Condition DonePicking == true
	@Condition PickedBoss == eventPlayer
	@Condition PerkUltCharge > 0
	
	if eventPlayer.getUltCharge() > eventPlayer.PrevUltCharge+1:
		eventPlayer.setUltCharge(eventPlayer.getUltCharge() + max(0, (eventPlayer.getUltCharge()-eventPlayer.PrevUltCharge)) * ULT_CHARGE_MULT**PerkUltCharge)
		eventPlayer.PrevUltCharge = eventPlayer.getUltCharge()
	wait(0.25)
	goto RULE_START

rule "Cooldown Reduction Perk Ability 1":
	@Event eachPlayer
	@Condition DonePicking == true
	@Condition PickedBoss == eventPlayer
	@Condition PerkCooldownReduction > 0
	@Condition eventPlayer.getAbilityCooldown(Button.ABILITY_1) == 0
	
	waitUntil(eventPlayer.getAbilityCooldown(Button.ABILITY_1) > 0, 99999)
	eventPlayer.setAbilityCooldown(Button.ABILITY_1, eventPlayer.getAbilityCooldown(Button.ABILITY_1) * (COOLDOWN_MULT**PerkCooldownReduction))

rule "Cooldown Reduction Perk Ability 2":
	@Event eachPlayer
	@Condition DonePicking == true
	@Condition PickedBoss == eventPlayer
	@Condition PerkCooldownReduction > 0
	@Condition eventPlayer.getAbilityCooldown(Button.ABILITY_2) == 0
	
	waitUntil(eventPlayer.getAbilityCooldown(Button.ABILITY_2) > 0, 99999)
	eventPlayer.setAbilityCooldown(Button.ABILITY_2, eventPlayer.getAbilityCooldown(Button.ABILITY_2) * (COOLDOWN_MULT**PerkCooldownReduction))

rule "Cooldown Reduction Perk Secondary":
	@Event eachPlayer
	@Condition DonePicking == true
	@Condition PickedBoss == eventPlayer
	@Condition PerkCooldownReduction > 0
	@Condition eventPlayer.getAbilityCooldown(Button.SECONDARY_FIRE) == 0
	
	waitUntil(eventPlayer.getAbilityCooldown(Button.SECONDARY_FIRE) > 0, 99999)
	eventPlayer.setAbilityCooldown(Button.SECONDARY_FIRE, eventPlayer.getAbilityCooldown(Button.SECONDARY_FIRE) * (COOLDOWN_MULT**PerkCooldownReduction))

rule "Cooldown Reduction Perk Tracer Blinks":
	@Event eachPlayer
	@Condition DonePicking == true
	@Condition PickedBoss == eventPlayer
	@Condition PerkCooldownReduction > 0
	@Condition eventPlayer.getCurrentHero() == Hero.TRACER
	@Condition eventPlayer.getAbilityCharge(Button.ABILITY_1) < 3
	
	wait(1 / ((1/(BLINK_COOLDOWN*COOLDOWN_MULT**PerkCooldownReduction))-1/BLINK_COOLDOWN))
	eventPlayer.setAbilityCharge(Button.ABILITY_1, min(3, eventPlayer.getAbilityCharge(Button.ABILITY_1) + 1))
	if RULE_CONDITION: goto RULE_START

rule "Cooldown Reduction Perk Concussion Mine":
	@Event eachPlayer
	@Condition DonePicking == true
	@Condition PickedBoss == eventPlayer
	@Condition PerkCooldownReduction > 0
	@Condition eventPlayer.getCurrentHero() == Hero.JUNKRAT
	@Condition eventPlayer.getAbilityCharge(Button.ABILITY_1) < 2
	
	wait(1 / ((1/(CONCUSSION_MINE_COOLDOWN*COOLDOWN_MULT**PerkCooldownReduction))-1/CONCUSSION_MINE_COOLDOWN))
	eventPlayer.setAbilityCharge(Button.ABILITY_1, min(2, eventPlayer.getAbilityCharge(Button.ABILITY_1) + 1))
	if RULE_CONDITION: goto RULE_START

# This doesn't work because of a workshop bug... there doesn't seem to be any way around it
# rule "Cooldown Reduction Perk Zarya Bubble":
# 	@Event eachPlayer
# 	@Condition DonePicking == true
# 	@Condition PickedBoss == eventPlayer
# 	@Condition PerkCooldownReduction > 0
# 	@Condition eventPlayer.getCurrentHero() == Hero.ZARYA
# 	@Condition eventPlayer.getAbilityCharge(Button.ABILITY_1) < 2
	
# 	wait(1 / ((1/(ZARYA_BUBBLE_COOLDOWN*COOLDOWN_MULT**PerkCooldownReduction))-1/ZARYA_BUBBLE_COOLDOWN))
# 	eventPlayer.setAbilityCharge(Button.ABILITY_1, eventPlayer.getAbilityCharge(Button.ABILITY_1) + 1)
# 	if RULE_CONDITION: goto RULE_START

# This doesn't work because of a workshop bug... and there seems to be no workaround
# rule "Cooldown Reduction Perk Firestrike":
# 	@Event eachPlayer
# 	@Condition DonePicking == true
# 	@Condition PickedBoss == eventPlayer
# 	@Condition PerkCooldownReduction > 0
# 	@Condition eventPlayer.getCurrentHero() == Hero.REINHARDT
# 	@Condition eventPlayer.getAbilityCharge(Button.ABILITY_2) < 2
	
# 	wait(1 / ((1/(FIRESTRIKE_COOLDOWN*COOLDOWN_MULT**PerkCooldownReduction))-1/FIRESTRIKE_COOLDOWN))
# 	eventPlayer.setAbilityCharge(Button.ABILITY_2, eventPlayer.getAbilityCharge(Button.ABILITY_2) + 1)
# 	if RULE_CONDITION: goto RULE_START

rule "Cooldown Reduction Perk Sym Turret":
	@Event eachPlayer
	@Condition DonePicking == true
	@Condition PickedBoss == eventPlayer
	@Condition PerkCooldownReduction > 0
	@Condition eventPlayer.getCurrentHero() == Hero.SYMMETRA
	@Condition eventPlayer.getAbilityCharge(Button.ABILITY_1) < 3
	
	wait(1 / ((1/(SYM_TURRET_COOLDOWN*COOLDOWN_MULT**PerkCooldownReduction))-1/SYM_TURRET_COOLDOWN))
	eventPlayer.setAbilityCharge(Button.ABILITY_1, eventPlayer.getAbilityCharge(Button.ABILITY_1) + 1)
	if RULE_CONDITION: goto RULE_START

rule "Health/Armor/Shield Perk":
	@Event eachPlayer
	@Condition DonePicking == true
	@Condition PickedBoss == eventPlayer
	@Condition PerkHealthAddition > 0 or PerkArmorAddition > 0 or PerkShieldAddition > 0
	
	eventPlayer.removeAllHealthPools()
	eventPlayer.setMaxHealth(100 * HEALTH_ADD_MULT**PerkHealthAddition)
	eventPlayer.setHealth(eventPlayer.getMaxHealth())
	if PerkArmorAddition > 0:
		eventPlayer.addHealthPool(Health.ARMOR, 25*ceil(eventPlayer.getMaxHealth() * (-1 + ARMOR_ADD_MULT**PerkArmorAddition) / 25), true, false)
	if PerkShieldAddition > 0:
		eventPlayer.addHealthPool(Health.SHIELDS, 25*ceil(eventPlayer.getMaxHealth() * (-1 + SHIELD_ADD_MULT**PerkShieldAddition) / 25), true, false)

rule "Health/Armor Tracer Recall Workshop Bug Fix":
	@Event eachPlayer
	@Condition DonePicking == true
	@Condition PickedBoss == eventPlayer
	@Condition PerkHealthAddition > 0 or PerkArmorAddition > 0
	@Condition eventPlayer.getCurrentHero() == Hero.TRACER
	@Condition eventPlayer.isUsingAbility2()
	
	waitUntil(not eventPlayer.isUsingAbility2(), 2)
	heal(eventPlayer, eventPlayer, eventPlayer.RecallHealth[(eventPlayer.RecallHealthIndex+1)%180] - eventPlayer.getHealth())

rule "Health/Armor Tracer Recall Workshop Bug Fix Health Tracker":
	@Event eachPlayer
	@Condition DonePicking == true
	@Condition PickedBoss == eventPlayer
	@Condition PerkHealthAddition > 0 or PerkArmorAddition > 0
	@Condition eventPlayer.getCurrentHero() == Hero.TRACER
	
	waitUntil(not eventPlayer.isUsingAbility2(), 2)
	eventPlayer.RecallHealth[eventPlayer.RecallHealthIndex] = eventPlayer.getHealth()
	eventPlayer.RecallHealthIndex = (eventPlayer.RecallHealthIndex + 1) % 180
	wait(0.016)
	goto RULE_START

rule "Damage Reduction Perk":
	@Event eachPlayer
	@Condition DonePicking == true
	@Condition PickedBoss == eventPlayer
	@Condition PerkDamageReduction > 0
	
	eventPlayer.setDamageReceived(100 * DAMAGE_RECEIVE_MULT ** PerkDamageReduction)

rule "Damage Dealt Perk":
	@Event eachPlayer
	@Condition DonePicking == true
	@Condition PickedBoss == eventPlayer
	@Condition PerkDamageDealt > 0
	
	eventPlayer.setDamageDealt(100 * DAMAGE_DEALT_MULT ** PerkDamageDealt)

rule "Health Regen Perk":
	@Event eachPlayer
	@Condition DonePicking == true
	@Condition PickedBoss == eventPlayer
	@Condition PerkHealthRegen > 0
	@Condition eventPlayer.hasSpawned() == true
	
	eventPlayer.stopAllHoT()
	eventPlayer.startHoT(eventPlayer, 99999, REGEN_RATE*PerkHealthRegen)
	# eventPlayer.PrevHero = eventPlayer.getCurrentHero()
	# waitUntil(eventPlayer.getCurrentHero() != eventPlayer.PrevHero, 99999)
	# goto RULE_START
	# eventPlayer.startHoT(eventPlayer, 99999, 20*PerkHealthRegen / 1.25**(PerkHealthAddition + PerkArmorAddition))

rule "Move Speed Perk":
	@Event eachPlayer
	@Condition DonePicking == true
	@Condition PickedBoss == eventPlayer
	@Condition PerkMoveSpeed > 0
	
	eventPlayer.setMoveSpeed(100 * MOVE_SPEED_MULT ** PerkMoveSpeed)

rule "Knockback Perk":
	@Event eachPlayer
	@Condition DonePicking == true
	@Condition PickedBoss == eventPlayer
	@Condition PerkKnockback > 0
	
	eventPlayer.setKnockbackDealt(100 * KNOCKBACK_MULT ** PerkKnockback)

rule "Knockback Doomfist Punch Bug":
	@Event playerDealtKnockback
	@Condition DonePicking == true
	@Condition PickedBoss == eventPlayer
	@Condition PerkKnockback > 0
	@Condition eventPlayer.getCurrentHero() == Hero.DOOMFIST
	@Condition eventPlayer.isFiringSecondaryFire()
	
	victim.applyImpulse(eventDirection, victim.getSpeed() * (-1 + KNOCKBACK_MULT ** PerkKnockback), Relativity.TO_WORLD, Impulse.INCORPORATE_CONTRARY_MOTION)

rule "Healing Received Perk":
	@Event eachPlayer
	@Condition DonePicking == true
	@Condition PickedBoss == eventPlayer
	@Condition PerkHealingReceived > 0
	
	eventPlayer.setHealingReceived(100 * HEALING_RECEIVED_MULT ** PerkHealingReceived)

rule "Fire Damage Perk":
	@Event playerDealtDamage
	@Condition DonePicking == true
	@Condition PickedBoss == eventPlayer
	@Condition PerkFireDamage > 0
	@Condition eventAbility != null
	
	victim.startDoT(eventPlayer, FIRE_DAMAGE_DURATION, eventDamage * FIRE_DAMAGE_MULT ** PerkFireDamage / FIRE_DAMAGE_DURATION)
	victim.setStatusEffect(null, Status.BURNING, FIRE_DAMAGE_DURATION)

rule "Death Cleanses Fire Damage":
	@Event playerDied
	@Condition PerkFireDamage > 0
	
	wait()
	eventPlayer.stopAllDoT()
	eventPlayer.clearStatusEffect(Status.BURNING)
	

rule "Knockback Immunity Perk":
	@Event eachPlayer
	@Condition DonePicking == true
	@Condition PickedBoss == eventPlayer
	@Condition PerkKnockbackImmunity > 0
	
	eventPlayer.setKnockbackReceived(0)

rule "Projectile Speed Perk":
	@Event eachPlayer
	@Condition DonePicking == true
	@Condition PickedBoss == eventPlayer
	@Condition PerkProjectileSpeed > 0
	
	eventPlayer.setProjectileSpeed(100 * PROJECTILE_SPEED_MULT ** PerkProjectileSpeed)

rule "Update Objective Position":
	@Condition isGameInProgress()
	
	if getCurrentGamemode() == Gamemode.ESCORT or (getCurrentGamemode() == Gamemode.HYBRID and getCurrentObjective() > 0):
		ObjectivePosition = getPayloadPosition()
	else:
		ObjectivePosition = getObjectivePosition(getCurrentObjective())
	wait(0.25)
	goto RULE_START

rule "Payload Bicth Perk":
	@Event eachPlayer
	@Condition DonePicking == true
	@Condition PickedBoss == eventPlayer
	@Condition eventPlayer.hasSpawned()
	@Condition PerkPayloadBicth > 0
	
	wait(1)
	createDummy([Hero.ANA, Hero.MERCY, Hero.ZENYATTA], eventPlayer.getTeam(), -1, eventPlayer.getPosition(), vect(0, 0, 1))
	PayloadBicth = getLastCreatedEntity()
	waitUntil(isGameInProgress(), 60)
	chase(PayloadBicthSpawnTimer, 0, rate = 1, ChaseReeval.NONE)
	while true:
		waitUntil(PayloadBicth.isAlive() and PayloadBicthSpawnTimer == 0 and getPlayersOnObjective(Team.ALL) == [eventPlayer], 99999)
		PayloadBicth.teleport(nearestWalkablePosition(ObjectivePosition))
		PayloadBicthSpawnTimer = PAYLOAD_BITCH_COOLDOWN

rule "Payload Bicth Name":
	@Event eachPlayer
	@Condition eventPlayer.isDummy()
	
	eventPlayer.startForcingName("Payload Bitch")

rule "Payload Bicth Walk Towards Point":
	@Event eachPlayer
	@Condition PayloadBicth == eventPlayer
	@Condition distance(eventPlayer.getPosition(), ObjectivePosition) > 4
	
	wait(0.25)
	eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), ObjectivePosition), 360, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
	eventPlayer.startForcingThrottle(1, 1, 0, 0, 0, 0)
	waitUntil(distance(eventPlayer.getPosition(), ObjectivePosition) < 2, 99999)
	eventPlayer.stopFacing()
	eventPlayer.stopForcingThrottle()
	if RULE_CONDITION: goto RULE_START

rule "Elimination Heal Perk":
	@Event playerDealtFinalBlow
	@Condition DonePicking == true
	@Condition PickedBoss == eventPlayer
	@Condition PerkEliminationHeal > 0
	
	heal(eventPlayer, eventPlayer, ELIMINATION_HEALING * PerkEliminationHeal)



rule "Picking Boss":
	@Condition PickingBoss == true
	
	Timer = BOSS_PICKING_TIME
	hudSubtext(getAllPlayers(), "Choose {1} The Boss\n{0}s Remain".format(ceil(Timer), buttonString(Button.PRIMARY_FIRE)), HudPosition.TOP, 1, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
	InstructionText = getLastCreatedText()
	wait(5)
	waitUntil(Timer == 0 or PlayerVotes == getNumberOfPlayers(Team.ALL), 60)
	destroyHudText(InstructionText)
	# if nobody votes, it's random
	PickedBoss = random.choice(getAllPlayers())
	for Iterator in range(len(getAllPlayers())):
		# TODO: Tie breakers (probably just random choice, right now it picks the first one)
		if getAllPlayers()[Iterator].VotesToBecomeBoss > PickedBoss.VotesToBecomeBoss:
			PickedBoss = getAllPlayers()[Iterator]
	PlayerVotes = 0
	PickingBoss = false
	uWager()
	PickingPerks = true

rule "Picking Perks":
	@Condition PickingPerks == true
	
	Timer = PERK_PICKING_TIME
	hudSubtext(
		PickedBoss,
		"Choose Perks\n{0}s Remain\nAdd: {1}   Remove: {2}\nVote Skip: {3}".format(
			ceil(Timer),
			buttonString(Button.PRIMARY_FIRE),
			buttonString(Button.SECONDARY_FIRE),
			buttonString(Button.INTERACT)
		), HudPosition.TOP, 1, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
	InstructionText[0] = getLastCreatedText()
	hudSubtext(
		[p for p in getAllPlayers() if p != PickedBoss],
		"Choose Boons\n{0}s Remain\nAdd: {1}   Remove: {2}\nVote Skip: {3}".format(
			ceil(Timer),
			buttonString(Button.PRIMARY_FIRE),
			buttonString(Button.SECONDARY_FIRE),
			buttonString(Button.INTERACT)
		), HudPosition.TOP, 1, Color.WHITE, HudReeval.STRING, SpecVisibility.ALWAYS)
	InstructionText[1] = getLastCreatedText()
	wait(5)
	# waitUntil(Timer == 0 or PlayerVotes >= 1, 120)
	waitUntil(Timer == 0 or PlayerVotes > (getNumberOfPlayers(Team.ALL)/2), 120)
	destroyHudText(InstructionText[0])
	destroyHudText(InstructionText[1])
	PickingPerks = false
	# wait for default perks
	wait(1)
	if PerkPayloadBicth > 0:
		TeamBoss = Team.2
		TeamHeroes = Team.1
	setMatchTime(30)
	DonePicking = true


rule "Move Players To Teams":
	@Event eachPlayer
	@Condition DonePicking == true
	
	if eventPlayer == PickedBoss:
		if eventPlayer.getTeam() != TeamBoss:
			moveToTeam(eventPlayer, TeamBoss, -1)
	else:
		if eventPlayer.getTeam() != TeamHeroes:
			moveToTeam(eventPlayer, TeamHeroes, -1)

rule "Pick Boss Player UI":
	@Event eachPlayer
	@Condition PickingBoss == true
	
	wait(1)
	eventPlayer.PlayersToPick = getAllPlayers()
	eventPlayer.Texts = []
	for eventPlayer.Iterator in range(len(eventPlayer.PlayersToPick)):
		createInWorldText(eventPlayer, "{0}".format(eventPlayer.PlayersToPick[eventPlayer.Iterator]), updateEveryTick(eventPlayer.getEyePosition() + angleToDirection(evalOnce(eventPlayer.Iterator) * 360 / len(eventPlayer.PlayersToPick), 0)), 2, Clip.NONE, WorldTextReeval.VISIBILITY_AND_POSITION, Color.WHITE, SpecVisibility.DEFAULT)
		eventPlayer.Texts.append(getLastCreatedText())
	waitUntil(eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) or PickingBoss == false, 99999)
	for eventPlayer.Iterator in range(len(eventPlayer.Texts)):
		destroyInWorldText(eventPlayer.Texts[eventPlayer.Iterator])
	if PickingBoss == false:
		return
	eventPlayer.Picked = (round((eventPlayer.getHorizontalFacingAngle() + 360) / 360 * len(eventPlayer.PlayersToPick))) % len(eventPlayer.PlayersToPick)
	eventPlayer.PlayersToPick[eventPlayer.Picked].VotesToBecomeBoss += 1
	bigMessage(eventPlayer, "You Picked {0}".format(eventPlayer.PlayersToPick[eventPlayer.Picked]))
	playEffect(getAllPlayers(), DynamicEffect.BUFF_EXPLOSION_SOUND, Color.WHITE, eventPlayer, 75)
	PlayerVotes += 1

#!define PERK_LOOKED_AT (round((eventPlayer.getHorizontalFacingAngle() + 360) / (360 / len(PerksToPick)))) % len(PerksToPick)

rule "Pick Perks Player UI":
	@Event eachPlayer
	@Condition PickingPerks == true
	@Condition PickedBoss == eventPlayer
	
	eventPlayer.Texts = []
	for eventPlayer.Iterator in range(len(PerksToPick)):
		createInWorldText(eventPlayer, "{0}\n{1}".format(PerksPicked[evalOnce(eventPlayer.Iterator)], PerksToPick[evalOnce(eventPlayer.Iterator)]), updateEveryTick(eventPlayer.getEyePosition() + angleToDirection(evalOnce(eventPlayer.Iterator) * 360 / len(PerksToPick), 0)), 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_STRING_AND_COLOR, rgb(
			128 + PerksPicked[evalOnce(eventPlayer.Iterator)]*1024.0/PerkLimits[evalOnce(eventPlayer.Iterator)],
			128 + PerksPicked[evalOnce(eventPlayer.Iterator)]*256.0/PerkLimits[evalOnce(eventPlayer.Iterator)],
			128 + PerksPicked[evalOnce(eventPlayer.Iterator)]*128.0/PerkLimits[evalOnce(eventPlayer.Iterator)]
		), SpecVisibility.DEFAULT)
		eventPlayer.Texts.append(getLastCreatedText())
	while PickingPerks:
		wait(0.25)
		waitUntil(
			eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) or
			eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) or
			eventPlayer.isHoldingButton(Button.INTERACT) or
			PickingPerks == false
		, 99999)
		if PickingPerks:
			eventPlayer.Picked = PERK_LOOKED_AT
			if eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) and PerksPicked[eventPlayer.Picked] < PerkLimits[eventPlayer.Picked]:
				playEffect(getAllPlayers(), DynamicEffect.BUFF_EXPLOSION_SOUND, Color.WHITE, eventPlayer, 50)
				PerksPicked[eventPlayer.Picked] += 1
			elif eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) and PerksPicked[eventPlayer.Picked] > 0.5:
				playEffect(getAllPlayers(), DynamicEffect.DEBUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 50)
				PerksPicked[eventPlayer.Picked] -= 1
			elif eventPlayer.isHoldingButton(Button.INTERACT):
				PlayerVotes += 1
				break
			switch eventPlayer.Picked:
				case 0:
					uPerkStringUltCharge()
				case 1:
					uPerkStringHealthAddition()
				case 2:
					uPerkStringArmorAddition()
				case 3:
					uPerkStringShieldAddition()
				case 4:
					uPerkStringDamageReduction()
				case 5:
					uPerkStringDamageDealt()
				case 6:
					uPerkStringCooldowns()
				case 7:
					uPerkStringHealthRegen()
				case 8:
					uPerkStringMoveSpeed()
				case 9:
					uPerkStringKnockback()
				case 10:
					uPerkStringHealingReceived()
				case 11:
					uPerkStringFireDamage()
				case 12:
					uStringScale()
				case 14:
					uPerkStringProjSpeed()
				case 16:
					uPerkStringEliminationHeal()
			uWager()
	for eventPlayer.Iterator in range(len(eventPlayer.Texts)):
		destroyInWorldText(eventPlayer.Texts[eventPlayer.Iterator])

#!define BOON_LOOKED_AT (round((eventPlayer.getHorizontalFacingAngle() + 360) / (360 / len(BoonsToPick)))) % len(BoonsToPick)

rule "Pick Boons Player UI":
	@Event eachPlayer
	@Condition PickingPerks == true
	@Condition PickedBoss != eventPlayer
	
	eventPlayer.Texts = []
	for eventPlayer.Iterator in range(len(BoonsToPick)):
		createInWorldText(eventPlayer, "{0}\n{1}".format(BoonsPicked[evalOnce(eventPlayer.Iterator)], BoonsToPick[evalOnce(eventPlayer.Iterator)]), updateEveryTick(eventPlayer.getEyePosition() + evalOnce(angleToDirection(eventPlayer.Iterator * 360 / len(BoonsToPick), 0))), 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_STRING_AND_COLOR, rgb(
			128 + BoonsPicked[evalOnce(eventPlayer.Iterator)]*512.0/BoonLimits[evalOnce(eventPlayer.Iterator)],
			128 + BoonsPicked[evalOnce(eventPlayer.Iterator)]*256.0/BoonLimits[evalOnce(eventPlayer.Iterator)],
			128 + BoonsPicked[evalOnce(eventPlayer.Iterator)]*128.0/BoonLimits[evalOnce(eventPlayer.Iterator)]
		), SpecVisibility.DEFAULT)
		eventPlayer.Texts.append(getLastCreatedText())
	while PickingPerks:
		wait(0.25)
		waitUntil(
			eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) or
			eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) or
			eventPlayer.isHoldingButton(Button.INTERACT) or
			PickingPerks == false
		, 99999)
		if PickingPerks:
			eventPlayer.Picked = BOON_LOOKED_AT
			if eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) and BoonsPicked[eventPlayer.Picked] < BoonLimits[eventPlayer.Picked]:
				playEffect(getAllPlayers(), DynamicEffect.BUFF_EXPLOSION_SOUND, Color.WHITE, eventPlayer, 50)
				BoonsPicked[eventPlayer.Picked] += 1
			elif eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) and BoonsPicked[eventPlayer.Picked] > 0:
				playEffect(getAllPlayers(), DynamicEffect.DEBUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 50)
				BoonsPicked[eventPlayer.Picked] -= 1
			elif eventPlayer.isHoldingButton(Button.INTERACT):
				PlayerVotes += 1
				break
			switch eventPlayer.Picked:
				case 0:
					uBoonStringUltCharge()
				case 1:
					uBoonStringSelfResurrect()
				case 2:
					uBoonStringInvisibility()
				case 3:
					uBoonStringTankHealth()
				case 4:
					uBoonStringDamageDamage()
				case 5:
					uBoonStringSupportMoveSpeed()
				case 6:
					uBoonStringHealthAbsorption()
				case 7:
					uStringScale()
			uWager()
	for eventPlayer.Iterator in range(len(eventPlayer.Texts)):
		destroyInWorldText(eventPlayer.Texts[eventPlayer.Iterator])


rule "Skip Assembling Heroes":
	@Condition isAssemblingHeroes() == true
	
	setMatchTime(0)
	wait()
	setMatchTime(150)

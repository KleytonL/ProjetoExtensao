extends Node

const ICON_PATH = "res://resources/spritesheets/"
const WEAPON_PATH = "res://resources/spritesheets/"
const UPGRADES = {
	"soulfire1": {
		"icon": WEAPON_PATH + "spritesheet-soulfire.svg",
		"displayname": "Soulfire",
		"details": "Sua alma erradia esperança!",
		"level": "Level 1",
		"prerequisite": [],
		"type": "weapon"
	},
	"soulfire2": {
		"icon": WEAPON_PATH + "spritesheet-soulfire.svg",
		"displayname": "Soulfire",
		"details": "Dispara 1 projétil adicional.",
		"level": "Level 2",
		"prerequisite": ["soulfire1"],
		"type": "weapon"
	},
	"soulfire3": {
		"icon": WEAPON_PATH + "spritesheet-soulfire.svg",
		"displayname": "Soulfire",
		"details": "Sua soulfire pode acertar 2 inimigos.",
		"level": "Level 3",
		"prerequisite": ["soulfire2"],
		"type": "weapon"
	},
	"soulfire4": {
		"icon": WEAPON_PATH + "spritesheet-soulfire.svg",
		"displayname": "Soulfire",
		"details": "Dispara 1 projétil adicional.",
		"level": "Level 4",
		"prerequisite": ["soulfire3"],
		"type": "weapon"
	},
	"soulfire5": {
		"icon": WEAPON_PATH + "spritesheet-soulfire.svg",
		"displayname": "Soulfire",
		"details": "Aumenta velocidade e cadência de disparo.",
		"level": "Level 5",
		"prerequisite": ["soulfire4"],
		"type": "weapon"
	},
	"soulfire6": {
		"icon": WEAPON_PATH + "spritesheet-soulfire.svg",
		"displayname": "Soulfire",
		"details": "Aumenta o dano em 2 e pode acertar até 3 inimigos.",
		"level": "Level MAX",
		"prerequisite": ["soulfire5"],
		"type": "weapon"
	},
	"shield1": {
		"icon": WEAPON_PATH + "spritesheet-misc.svg",
		"displayname": "Escudo Orbital",
		"details": "Invoca 1 orbe que gira ao seu redor.",
		"level": "Level 1",
		"prerequisite": [],
		"type": "weapon"
	},
	"shield2": {
		"icon": WEAPON_PATH + "spritesheet-misc.svg",
		"displayname": "Escudo Orbital",
		"details": "Adiciona +1 orbe e aumenta o dano.",
		"level": "Level 2",
		"prerequisite": ["shield1"],
		"type": "weapon"
	},
	"shield3": {
		"icon": WEAPON_PATH + "spritesheet-misc.svg",
		"displayname": "Escudo Orbital",
		"details": "Aumenta dano e reduz recarga.",
		"level": "Level 3",
		"prerequisite": ["shield2"],
		"type": "weapon"
	},
	"shield4": {
		"icon": WEAPON_PATH + "spritesheet-misc.svg",
		"displayname": "Escudo Orbital",
		"details": "Adiciona +1 orbe (total: 3).",
		"level": "Level 4",
		"prerequisite": ["shield3"],
		"type": "weapon"
	},
	"shield5": {
		"icon": WEAPON_PATH + "spritesheet-misc.svg",
		"displayname": "Escudo Orbital",
		"details": "Adiciona +1 orbe (total: 4).",
		"level": "Level 5",
		"prerequisite": ["shield4"],
		"type": "weapon"
	},
	"shield6": {
		"icon": WEAPON_PATH + "spritesheet-misc.svg",
		"displayname": "Escudo Orbital",
		"details": "Dano máximo e giro mais veloz.",
		"level": "Level MAX",
		"prerequisite": ["shield5"],
		"type": "weapon"
	},
	"food": {
		"icon": ICON_PATH + "spritesheet-hayato.svg",
		"displayname": "Comida",
		"details": "Restaura 5 de vida!",
		"level": "N/A",
		"prerequisite": [],
		"type": "item"
	}
}

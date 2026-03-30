extends Node

const ICON_PATH = "res://resources/icons/"
const UPGRADES = {
	"soulfire1": {
		"icon": ICON_PATH + "icon-soulfire.svg",
		"displayname": "Soulfire",
		"details": "Dispara um projétil flamejante!",
		"level": "Level 1",
		"prerequisite": [],
		"type": "weapon",
		"key": "soulfire"
	},
	"soulfire2": {
		"icon": ICON_PATH + "icon-soulfire.svg",
		"displayname": "Soulfire",
		"details": "Dispara +1 projétil adicional.",
		"level": "Level 2",
		"prerequisite": ["soulfire1"],
		"type": "weapon",
		"key": "soulfire"
	},
	"soulfire3": {
		"icon": ICON_PATH + "icon-soulfire.svg",
		"displayname": "Soulfire",
		"details": "Sua soulfire pode acertar 2 inimigos.",
		"level": "Level 3",
		"prerequisite": ["soulfire2"],
		"type": "weapon",
		"key": "soulfire"
	},
	"soulfire4": {
		"icon": ICON_PATH + "icon-soulfire.svg",
		"displayname": "Soulfire",
		"details": "Dispara +1 projétil adicional.",
		"level": "Level 4",
		"prerequisite": ["soulfire3"],
		"type": "weapon",
		"key": "soulfire"
	},
	"soulfire5": {
		"icon": ICON_PATH + "icon-soulfire.svg",
		"displayname": "Soulfire",
		"details": "Aumenta velocidade e cadência de disparo.",
		"level": "Level 5",
		"prerequisite": ["soulfire4"],
		"type": "weapon",
		"key": "soulfire"
	},
	"soulfire6": {
		"icon": ICON_PATH + "icon-soulfire.svg",
		"displayname": "Soulfire",
		"details": "Aumenta o dano em 2 e pode acertar até 3 inimigos.",
		"level": "Level MAX",
		"prerequisite": ["soulfire5"],
		"type": "weapon",
		"key": "soulfire"
	},
	"shield1": {
		"icon": ICON_PATH + "icon-orbitalshield.svg",
		"displayname": "Escudo Orbital",
		"details": "Invoca 1 orbe que gira ao seu redor.",
		"level": "Level 1",
		"prerequisite": [],
		"type": "weapon",
		"key": "shield"
	},
	"shield2": {
		"icon": ICON_PATH + "icon-orbitalshield.svg",
		"displayname": "Escudo Orbital",
		"details": "Adiciona +1 orbe e aumenta velocidade de rotação",
		"level": "Level 2",
		"prerequisite": ["shield1"],
		"type": "weapon",
		"key": "shield"
	},
	"shield3": {
		"icon": ICON_PATH + "icon-orbitalshield.svg",
		"displayname": "Escudo Orbital",
		"details": "Aumenta dano e reduz recarga.",
		"level": "Level 3",
		"prerequisite": ["shield2"],
		"type": "weapon",
		"key": "shield"
	},
	"shield4": {
		"icon": ICON_PATH + "icon-orbitalshield.svg",
		"displayname": "Escudo Orbital",
		"details": "Adiciona +1 orbe (total: 3).",
		"level": "Level 4",
		"prerequisite": ["shield3"],
		"type": "weapon",
		"key": "shield"
	},
	"shield5": {
		"icon": ICON_PATH + "icon-orbitalshield.svg",
		"displayname": "Escudo Orbital",
		"details": "Adiciona +1 orbe (total: 4).",
		"level": "Level 5",
		"prerequisite": ["shield4"],
		"type": "weapon",
		"key": "shield"
	},
	"shield6": {
		"icon": ICON_PATH + "icon-orbitalshield.svg",
		"displayname": "Escudo Orbital",
		"details": "Dano máximo e giro mais veloz.",
		"level": "Level MAX",
		"prerequisite": ["shield5"],
		"type": "weapon",
		"key": "shield"
	},
	"boomerang1": {
		"icon": ICON_PATH + "icon-boomerang.svg",
		"displayname": "Boomerang",
		"details": "Arremessa um boomerang que retorna para a direção do jogador.",
		"level": "Level 1",
		"prerequisite": [],
		"type": "weapon",
		"key": "boomerang"
	},
	"boomerang2": {
		"icon": ICON_PATH + "icon-boomerang.svg",
		"displayname": "Boomerang",
		"details": "Arremessa um boomerang que retorna para a direção do jogador.",
		"level": "Level 2",
		"prerequisite": ["boomerang1"],
		"type": "weapon",
		"key": "boomerang"
	},
	"boomerang3": {
		"icon": ICON_PATH + "icon-boomerang.svg",
		"displayname": "Boomerang",
		"details": "Arremessa um boomerang que retorna para a direção do jogador.",
		"level": "Level 3",
		"prerequisite": ["boomerang2"],
		"type": "weapon",
		"key": "boomerang"
	},
	"boomerang4": {
		"icon": ICON_PATH + "icon-boomerang.svg",
		"displayname": "Boomerang",
		"details": "Arremessa um boomerang que retorna para a direção do jogador.",
		"level": "Level 4",
		"prerequisite": ["boomerang3"],
		"type": "weapon",
		"key": "boomerang"
	},
	"boomerang5": {
		"icon": ICON_PATH + "icon-boomerang.svg",
		"displayname": "Boomerang",
		"details": "Arremessa um boomerang que retorna para a direção do jogador.",
		"level": "Level 5",
		"prerequisite": ["boomerang4"],
		"type": "weapon",
		"key": "boomerang"
	},
	"boomerang6": {
		"icon": ICON_PATH + "icon-boomerang.svg",
		"displayname": "Boomerang",
		"details": "Arremessa um boomerang que retorna para a direção do jogador.",
		"level": "Level MAX",
		"prerequisite": ["boomerang5"],
		"type": "weapon",
		"key": "boomerang"
	},
	"food": {
		"icon": ICON_PATH + "icon-food.svg",
		"displayname": "Comida",
		"details": "Restaura 5 de vida!",
		"level": "~",
		"prerequisite": [],
		"type": "item"
	}
}

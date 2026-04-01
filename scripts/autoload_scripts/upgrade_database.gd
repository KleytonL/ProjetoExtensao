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
		"details": "Dispara mais um projétil adicional.",
		"level": "Level 2",
		"prerequisite": ["soulfire1"],
		"type": "weapon",
		"key": "soulfire"
	},
	"soulfire3": {
		"icon": ICON_PATH + "icon-soulfire.svg",
		"displayname": "Soulfire",
		"details": "Cada soulfire pode acertar até dois inimigos.",
		"level": "Level 3",
		"prerequisite": ["soulfire2"],
		"type": "weapon",
		"key": "soulfire"
	},
	"soulfire4": {
		"icon": ICON_PATH + "icon-soulfire.svg",
		"displayname": "Soulfire",
		"details": "Dispara mais um projétil adicional.",
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
		"details": "Aumenta o dano em dois e pode acertar até três inimigos.",
		"level": "Level MAX",
		"prerequisite": ["soulfire5"],
		"type": "weapon",
		"key": "soulfire"
	},
	"shield1": {
		"icon": ICON_PATH + "icon-orbitalshield.svg",
		"displayname": "Escudo Orbital",
		"details": "Invoca um escudo que gira ao seu redor.",
		"level": "Level 1",
		"prerequisite": [],
		"type": "weapon",
		"key": "shield"
	},
	"shield2": {
		"icon": ICON_PATH + "icon-orbitalshield.svg",
		"displayname": "Escudo Orbital",
		"details": "Adiciona mais um escudo e aumenta o dano.",
		"level": "Level 2",
		"prerequisite": ["shield1"],
		"type": "weapon",
		"key": "shield"
	},
	"shield3": {
		"icon": ICON_PATH + "icon-orbitalshield.svg",
		"displayname": "Escudo Orbital",
		"details": "Aumenta duração, velocidade de rotação e repulsão.",
		"level": "Level 3",
		"prerequisite": ["shield2"],
		"type": "weapon",
		"key": "shield"
	},
	"shield4": {
		"icon": ICON_PATH + "icon-orbitalshield.svg",
		"displayname": "Escudo Orbital",
		"details": "Adiciona mais um escudo adicional, aumenta dano e reduz recarga entre usos.",
		"level": "Level 4",
		"prerequisite": ["shield3"],
		"type": "weapon",
		"key": "shield"
	},
	"shield5": {
		"icon": ICON_PATH + "icon-orbitalshield.svg",
		"displayname": "Escudo Orbital",
		"details": "Aumenta duração, velocidade de rotação e distância dos escudos.",
		"level": "Level 5",
		"prerequisite": ["shield4"],
		"type": "weapon",
		"key": "shield"
	},
	"shield6": {
		"icon": ICON_PATH + "icon-orbitalshield.svg",
		"displayname": "Escudo Orbital",
		"details": "Adiciona mais um escudo adicional, aumenta o dano, tamanho, repulsão, velocidade de rotação e reduz tempo de recarga.",
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
		"details": "Aumenta velocidade e tamanho do boomerang.",
		"level": "Level 2",
		"prerequisite": ["boomerang1"],
		"type": "weapon",
		"key": "boomerang"
	},
	"boomerang3": {
		"icon": ICON_PATH + "icon-boomerang.svg",
		"displayname": "Boomerang",
		"details": "Arremessa mais um boomerang adicional e aumenta a repulsão.",
		"level": "Level 3",
		"prerequisite": ["boomerang2"],
		"type": "weapon",
		"key": "boomerang"
	},
	"boomerang4": {
		"icon": ICON_PATH + "icon-boomerang.svg",
		"displayname": "Boomerang",
		"details": "Aumenta velocidade de ataque e tamanho.",
		"level": "Level 4",
		"prerequisite": ["boomerang3"],
		"type": "weapon",
		"key": "boomerang"
	},
	"boomerang5": {
		"icon": ICON_PATH + "icon-boomerang.svg",
		"displayname": "Boomerang",
		"details": "Aumenta a velocidade e repulsão dos boomerangs.",
		"level": "Level 5",
		"prerequisite": ["boomerang4"],
		"type": "weapon",
		"key": "boomerang"
	},
	"boomerang6": {
		"icon": ICON_PATH + "icon-boomerang.svg",
		"displayname": "Boomerang",
		"details": "Arremessa mais um boomerang adicional, aumenta o dano e tamanho dos boomerangs.",
		"level": "Level MAX",
		"prerequisite": ["boomerang5"],
		"type": "weapon",
		"key": "boomerang"
	},
	"food": {
		"icon": ICON_PATH + "icon-food.svg",
		"displayname": "Refeição",
		"details": "Restaura 5 de vida!",
		"level": "~",
		"prerequisite": [],
		"type": "item"
	}
}

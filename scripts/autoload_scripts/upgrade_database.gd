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
	"speed1": {
		"icon": ICON_PATH + "icon-speed.svg",
		"displayname": "Velocidade",
		"details": "Aumenta a velocidade de movimento!",
		"level": "Level 1",
		"prerequisite": [],
		"type": "stats",
		"key": "speed",
		"value": 2
	},
	"speed2": {
		"icon": ICON_PATH + "icon-speed.svg",
		"displayname": "Velocidade",
		"details": "Aumenta a velocidade de movimento!",
		"level": "Level 2",
		"prerequisite": ["speed1"],
		"type": "stats",
		"key": "speed",
		"value": 3
	},
	"speed3": {
		"icon": ICON_PATH + "icon-speed.svg",
		"displayname": "Velocidade",
		"details": "Aumenta a velocidade de movimento!",
		"level": "Level 3",
		"prerequisite": ["speed2"],
		"type": "stats",
		"key": "speed",
		"value": 3
	},
	"speed4": {
		"icon": ICON_PATH + "icon-speed.svg",
		"displayname": "Velocidade",
		"details": "Aumenta a velocidade de movimento!",
		"level": "Level 4",
		"prerequisite": ["speed3"],
		"type": "stats",
		"key": "speed",
		"value": 4
	},
	"speed5": {
		"icon": ICON_PATH + "icon-speed.svg",
		"displayname": "Velocidade",
		"details": "Aumenta a velocidade de movimento!",
		"level": "Level 5",
		"prerequisite": ["speed4"],
		"type": "stats",
		"key": "speed",
		"value": 5
	},
	"speed6": {
		"icon": ICON_PATH + "icon-speed.svg",
		"displayname": "Velocidade",
		"details": "Aumenta a velocidade de movimento ao máximo!",
		"level": "Level MAX",
		"prerequisite": ["speed5"],
		"type": "stats",
		"key": "speed",
		"value": 8
	},
	"strength1": {
		"icon": ICON_PATH + "icon-strength.svg",
		"displayname": "Força",
		"details": "Aumenta a força de ataque!",
		"level": "Level 1",
		"prerequisite": [],
		"type": "stats",
		"key": "strength",
		"value": 1
	},
	"strength2": {
		"icon": ICON_PATH + "icon-strength.svg",
		"displayname": "Força",
		"details": "Aumenta a força de ataque!",
		"level": "Level 2",
		"prerequisite": ["strength2"],
		"type": "stats",
		"key": "strength",
		"value": 1
	},
	"strength3": {
		"icon": ICON_PATH + "icon-strength.svg",
		"displayname": "Força",
		"details": "Aumenta a força de ataque!",
		"level": "Level 3",
		"prerequisite": ["speed2"],
		"type": "stats",
		"key": "strength",
		"value": 1
	},
	"strength4": {
		"icon": ICON_PATH + "icon-strength.svg",
		"displayname": "Força",
		"details": "Aumenta a força de ataque!",
		"level": "Level 4",
		"prerequisite": ["strength3"],
		"type": "stats",
		"key": "strength",
		"value": 1
	},
	"strength5": {
		"icon": ICON_PATH + "icon-strength.svg",
		"displayname": "Força",
		"details": "Aumenta a força de ataque!",
		"level": "Level 5",
		"prerequisite": ["strength4"],
		"type": "stats",
		"key": "strength",
		"value": 1
	},
	"strength6": {
		"icon": ICON_PATH + "icon-strength.svg",
		"displayname": "Força",
		"details": "Aumenta a força de ataque!",
		"level": "Level MAX",
		"prerequisite": ["strength5"],
		"type": "stats",
		"key": "strength",
		"value": 1
	},
	"projectile1": {
		"icon": ICON_PATH + "icon-projectile.svg",
		"displayname": "Projétil Adicional",
		"details": "Adiciona um projétil a mais em todos os ataques!",
		"level": "Level 1",
		"prerequisite": [],
		"type": "stats",
		"key": "projectile",
		"value": 1
	},
	"projectile2": {
		"icon": ICON_PATH + "icon-projectile.svg",
		"displayname": "Projétil Adicional",
		"details": "Adiciona um projétil a mais em todos os ataques!",
		"level": "Level 2",
		"prerequisite": ["projectile1"],
		"type": "stats",
		"key": "projectile",
		"value": 1
	},
	"projectile3": {
		"icon": ICON_PATH + "icon-projectile.svg",
		"displayname": "Projétil Adicional",
		"details": "Adiciona um projétil a mais em todos os ataques!",
		"level": "Level 3",
		"prerequisite": ["projectile2"],
		"type": "stats",
		"key": "projectile",
		"value": 1
	},
	"projectile4": {
		"icon": ICON_PATH + "icon-projectile.svg",
		"displayname": "Projétil Adicional",
		"details": "Adiciona um projétil a mais em todos os ataques!",
		"level": "Level 4",
		"prerequisite": ["projectile3"],
		"type": "stats",
		"key": "projectile",
		"value": 1
	},
	"projectile5": {
		"icon": ICON_PATH + "icon-projectile.svg",
		"displayname": "Projétil Adicional",
		"details": "Adiciona um projétil a mais em todos os ataques!",
		"level": "Level 5",
		"prerequisite": ["projectile4"],
		"type": "stats",
		"key": "projectile",
		"value": 1
	},
	"projectile6": {
		"icon": ICON_PATH + "icon-projectile.svg",
		"displayname": "Projétil Adicional",
		"details": "Adiciona um projétil a mais em todos os ataques!",
		"level": "Level MAX",
		"prerequisite": ["projectile5"],
		"type": "stats",
		"key": "projectile",
		"value": 1
	},
	"projectile_size1": {
		"icon": ICON_PATH + "icon-projectilesize.svg",
		"displayname": "Projéteis Maiores",
		"details": "Aumenta o tamanho dos projéteis de todos os ataques!",
		"level": "Level 1",
		"prerequisite": [],
		"type": "stats",
		"key": "projectile_size",
		"value": 0.1
	},
	"projectile_size2": {
		"icon": ICON_PATH + "icon-projectilesize.svg",
		"displayname": "Projéteis Maiores",
		"details": "Aumenta o tamanho dos projéteis de todos os ataques!",
		"level": "Level 2",
		"prerequisite": ["projectile_size1"],
		"type": "stats",
		"key": "projectile_size",
		"value": 0.1
	},
	"projectile_size3": {
		"icon": ICON_PATH + "icon-projectilesize.svg",
		"displayname": "Projéteis Maiores",
		"details": "Aumenta o tamanho dos projéteis de todos os ataques!",
		"level": "Level 3",
		"prerequisite": ["projectile_size2"],
		"type": "stats",
		"key": "projectile_size",
		"value": 0.1
	},
	"projectile_size4": {
		"icon": ICON_PATH + "icon-projectilesize.svg",
		"displayname": "Projéteis Maiores",
		"details": "Aumenta o tamanho dos projéteis de todos os ataques!",
		"level": "Level 4",
		"prerequisite": ["projectile_size3"],
		"type": "stats",
		"key": "projectile_size",
		"value": 0.1
	},
	"projectile_size5": {
		"icon": ICON_PATH + "icon-projectilesize.svg",
		"displayname": "Projéteis Maiores",
		"details": "Aumenta o tamanho dos projéteis de todos os ataques!",
		"level": "Level 5",
		"prerequisite": ["projectile_size4"],
		"type": "stats",
		"key": "projectile_size",
		"value": 0.1
	},
	"projectile_size6": {
		"icon": ICON_PATH + "icon-projectilesize.svg",
		"displayname": "Projéteis Maiores",
		"details": "Aumenta o tamanho dos projéteis de todos os ataques!",
		"level": "Level MAX",
		"prerequisite": ["projectile_size5"],
		"type": "stats",
		"key": "projectile_size",
		"value": 0.1
	},
	"health1": {
		"icon": ICON_PATH + "icon-health.svg",
		"displayname": "Vida Máxima",
		"details": "Cura e aumenta a sua vida total em 5!",
		"level": "Level 1",
		"prerequisite": [],
		"type": "stats",
		"key": "health",
		"value": 5
	},
	"health2": {
		"icon": ICON_PATH + "icon-health.svg",
		"displayname": "Vida Máxima",
		"details": "Cura e aumenta a sua vida total em 5!",
		"level": "Level 2",
		"prerequisite": ["health1"],
		"type": "stats",
		"key": "health",
		"value": 5
	},
	"health3": {
		"icon": ICON_PATH + "icon-health.svg",
		"displayname": "Vida Máxima",
		"details": "Cura e aumenta a sua vida total em 5!",
		"level": "Level 3",
		"prerequisite": ["health2"],
		"type": "stats",
		"key": "health",
		"value": 5
	},
	"health4": {
		"icon": ICON_PATH + "icon-health.svg",
		"displayname": "Vida Máxima",
		"details": "Cura e aumenta a sua vida total em 10!",
		"level": "Level 4",
		"prerequisite": ["health3"],
		"type": "stats",
		"key": "health",
		"value": 10
	},
	"health5": {
		"icon": ICON_PATH + "icon-health.svg",
		"displayname": "Vida Máxima",
		"details": "Cura e aumenta a sua vida total em 10!",
		"level": "Level 5",
		"prerequisite": ["health4"],
		"type": "stats",
		"key": "health",
		"value": 10
	},
	"health6": {
		"icon": ICON_PATH + "icon-health.svg",
		"displayname": "Vida Máxima",
		"details": "Cura e aumenta a sua vida total em 15!",
		"level": "Level MAX",
		"prerequisite": ["health5"],
		"type": "stats",
		"key": "health",
		"value": 15
	},
	"food": {
		"icon": ICON_PATH + "icon-food.svg",
		"displayname": "Refeição",
		"details": "Restaura 10 de vida!",
		"level": "~",
		"prerequisite": [],
		"type": "consumable",
		"value": 10
	}
}

extends Node

const ICON_PATH: String = "res://resources/icons/"

const UPGRADES: Dictionary = {
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
		"details": "Adiciona mais um escudo adicional, aumenta o dano, velocidade de rotação e reduz tempo de recarga.",
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
	"thunderblade1": {
		"icon": ICON_PATH + "icon-thunderblade.svg",
		"displayname": "Thunder Blade",
		"details": "Uma lâmina elétrica cai sobre seus inimigos!",
		"level": "Level 1",
		"prerequisite": [],
		"type": "weapon",
		"key": "thunderblade"
	},
	"thunderblade2": {
		"icon": ICON_PATH + "icon-thunderblade.svg",
		"displayname": "Thunder Blade",
		"details": "Uma lâmina elétrica cai sobre seus inimigos!",
		"level": "Level 2",
		"prerequisite": ["thunderblade1"],
		"type": "weapon",
		"key": "thunderblade"
	},
	"thunderblade3": {
		"icon": ICON_PATH + "icon-thunderblade.svg",
		"displayname": "Thunder Blade",
		"details": "Uma lâmina elétrica cai sobre seus inimigos!",
		"level": "Level 3",
		"prerequisite": ["thunderblade2"],
		"type": "weapon",
		"key": "thunderblade"
	},
	"thunderblade4": {
		"icon": ICON_PATH + "icon-thunderblade.svg",
		"displayname": "Thunder Blade",
		"details": "Uma lâmina elétrica cai sobre seus inimigos!",
		"level": "Level 4",
		"prerequisite": ["thunderblade3"],
		"type": "weapon",
		"key": "thunderblade"
	},
	"thunderblade5": {
		"icon": ICON_PATH + "icon-thunderblade.svg",
		"displayname": "Thunder Blade",
		"details": "Uma lâmina elétrica cai sobre seus inimigos!",
		"level": "Level 5",
		"prerequisite": ["thunderblade4"],
		"type": "weapon",
		"key": "thunderblade"
	},
	"thunderblade6": {
		"icon": ICON_PATH + "icon-thunderblade.svg",
		"displayname": "Thunder Blade",
		"details": "Uma lâmina elétrica cai sobre seus inimigos!",
		"level": "Level MAX",
		"prerequisite": ["thunderblade5"],
		"type": "weapon",
		"key": "thunderblade"
	},
	"blazing1": {
		"icon": ICON_PATH + "icon-blazingground.svg",
		"displayname": "Blazing Ground",
		"details": "Faça o chão queimar!",
		"level": "Level 1",
		"prerequisite": [],
		"type": "weapon",
		"key": "blazing"
	},
	"blazing2": {
		"icon": ICON_PATH + "icon-blazingground.svg",
		"displayname": "Blazing Ground",
		"details": "Faça o chão queimar!",
		"level": "Level 2",
		"prerequisite": ["blazing1"],
		"type": "weapon",
		"key": "blazing"
	},
	"blazing3": {
		"icon": ICON_PATH + "icon-blazingground.svg",
		"displayname": "Blazing Ground",
		"details": "Faça o chão queimar!",
		"level": "Level 3",
		"prerequisite": ["blazing2"],
		"type": "weapon",
		"key": "blazing"
	},
	"blazing4": {
		"icon": ICON_PATH + "icon-blazingground.svg",
		"displayname": "Blazing Ground",
		"details": "Faça o chão queimar!",
		"level": "Level 4",
		"prerequisite": ["blazing3"],
		"type": "weapon",
		"key": "blazing"
	},
	"blazing5": {
		"icon": ICON_PATH + "icon-blazingground.svg",
		"displayname": "Blazing Ground",
		"details": "Faça o chão queimar!",
		"level": "Level 5",
		"prerequisite": ["blazing4"],
		"type": "weapon",
		"key": "blazing"
	},
	"blazing6": {
		"icon": ICON_PATH + "icon-blazingground.svg",
		"displayname": "Blazing Ground",
		"details": "Faça o chão queimar!",
		"level": "Level MAX",
		"prerequisite": ["blazing5"],
		"type": "weapon",
		"key": "blazing"
	},
	"radiance1": {
		"icon": ICON_PATH + "icon-radiance.svg",
		"displayname": "Radiância",
		"details": "Inimigos próximos recebem dano!",
		"level": "Level 1",
		"prerequisite": [],
		"type": "weapon",
		"key": "radiance"
	},
	"radiance2": {
		"icon": ICON_PATH + "icon-radiance.svg",
		"displayname": "Radiância",
		"details": "Inimigos próximos recebem dano!",
		"level": "Level 2",
		"prerequisite": ["radiance1"],
		"type": "weapon",
		"key": "radiance"
	},
	"radiance3": {
		"icon": ICON_PATH + "icon-radiance.svg",
		"displayname": "Radiância",
		"details": "Inimigos próximos recebem dano!",
		"level": "Level 3",
		"prerequisite": ["radiance2"],
		"type": "weapon",
		"key": "radiance"
	},
	"radiance4": {
		"icon": ICON_PATH + "icon-radiance.svg",
		"displayname": "Radiância",
		"details": "Inimigos próximos recebem dano!",
		"level": "Level 4",
		"prerequisite": ["radiance3"],
		"type": "weapon",
		"key": "radiance"
	},
	"radiance5": {
		"icon": ICON_PATH + "icon-radiance.svg",
		"displayname": "Radiância",
		"details": "Inimigos próximos recebem dano!",
		"level": "Level 5",
		"prerequisite": ["radiance4"],
		"type": "weapon",
		"key": "radiance"
	},
	"radiance6": {
		"icon": ICON_PATH + "icon-radiance.svg",
		"displayname": "Radiância",
		"details": "Inimigos próximos recebem dano!",
		"level": "Level MAX",
		"prerequisite": ["radiance5"],
		"type": "weapon",
		"key": "radiance"
	},
	"spearthrust1": {
		"icon": ICON_PATH + "icon-spear.svg",
		"displayname": "Estocada",
		"details": "Use uma lança para se proteger!",
		"level": "Level 1",
		"prerequisite": [],
		"type": "weapon",
		"key": "spear"
	},
	"spearthrust2": {
		"icon": ICON_PATH + "icon-spear.svg",
		"displayname": "Estocada",
		"details": "Use uma lança para se proteger!",
		"level": "Level 2",
		"prerequisite": ["spearthrust1"],
		"type": "weapon",
		"key": "spear"
	},
	"spearthrust3": {
		"icon": ICON_PATH + "icon-spear.svg",
		"displayname": "Estocada",
		"details": "Use uma lança para se proteger",
		"level": "Level 3",
		"prerequisite": ["spearthrust2"],
		"type": "weapon",
		"key": "spear"
	},
	"spearthrust4": {
		"icon": ICON_PATH + "icon-spear.svg",
		"displayname": "Estocada",
		"details": "Use uma lança para se proteger",
		"level": "Level 4",
		"prerequisite": ["spearthrust3"],
		"type": "weapon",
		"key": "spear"
	},
	"spearthrust5": {
		"icon": ICON_PATH + "icon-spear.svg",
		"displayname": "Estocada",
		"details": "Use uma lança para se proteger",
		"level": "Level 5",
		"prerequisite": ["spearthrust4"],
		"type": "weapon",
		"key": "spear"
	},
	"spearthrust6": {
		"icon": ICON_PATH + "icon-spear.svg",
		"displayname": "Estocada",
		"details": "Use uma lança para se proteger",
		"level": "Level MAX",
		"prerequisite": ["spearthrust5"],
		"type": "weapon",
		"key": "spear"
	},
	"cards1": {
		"icon": ICON_PATH + "icon-cards.svg",
		"displayname": "Cartas",
		"details": "Arremesse uma rajada de cartas!",
		"level": "Level 1",
		"prerequisite": [],
		"type": "weapon",
		"key": "cards"
	},
	"cards2": {
		"icon": ICON_PATH + "icon-cards.svg",
		"displayname": "Cartas",
		"details": "Arremesse uma rajada de cartas!",
		"level": "Level 2",
		"prerequisite": ["cards1"],
		"type": "weapon",
		"key": "cards"
	},
	"cards3": {
		"icon": ICON_PATH + "icon-cards.svg",
		"displayname": "Cartas",
		"details": "Arremesse uma rajada de cartas!",
		"level": "Level 3",
		"prerequisite": ["cards2"],
		"type": "weapon",
		"key": "cards"
	},
	"cards4": {
		"icon": ICON_PATH + "icon-cards.svg",
		"displayname": "Cartas",
		"details": "Arremesse uma rajada de cartas!",
		"level": "Level 4",
		"prerequisite": ["cards3"],
		"type": "weapon",
		"key": "cards"
	},
	"cards5": {
		"icon": ICON_PATH + "icon-cards.svg",
		"displayname": "Cartas",
		"details": "Arremesse uma rajada de cartas!",
		"level": "Level 5",
		"prerequisite": ["cards4"],
		"type": "weapon",
		"key": "cards"
	},
	"cards6": {
		"icon": ICON_PATH + "icon-cards.svg",
		"displayname": "Cartas",
		"details": "Arremesse uma rajada de cartas!",
		"level": "Level MAX",
		"prerequisite": ["cards5"],
		"type": "weapon",
		"key": "cards"
	},
	"marble1": {
		"icon": ICON_PATH + "icon-marble.svg",
		"displayname": "Gude",
		"details": "Arremesse uma bolinha de gude!",
		"level": "Level 1",
		"prerequisite": [],
		"type": "weapon",
		"key": "marble"
	},
	"marble2": {
		"icon": ICON_PATH + "icon-marble.svg",
		"displayname": "Gude",
		"details": "Arremesse uma bolinha de gude!",
		"level": "Level 2",
		"prerequisite": ["marble1"],
		"type": "weapon",
		"key": "marble"
	},
	"marble3": {
		"icon": ICON_PATH + "icon-marble.svg",
		"displayname": "Gude",
		"details": "Arremesse uma bolinha de gude!",
		"level": "Level 3",
		"prerequisite": ["marble2"],
		"type": "weapon",
		"key": "marble"
	},
	"marble4": {
		"icon": ICON_PATH + "icon-marble.svg",
		"displayname": "Gude",
		"details": "Arremesse uma bolinha de gude!",
		"level": "Level 4",
		"prerequisite": ["marble3"],
		"type": "weapon",
		"key": "marble"
	},
	"marble5": {
		"icon": ICON_PATH + "icon-marble.svg",
		"displayname": "Gude",
		"details": "Arremesse uma bolinha de gude!",
		"level": "Level 5",
		"prerequisite": ["marble4"],
		"type": "weapon",
		"key": "marble"
	},
	"marble6": {
		"icon": ICON_PATH + "icon-marble.svg",
		"displayname": "Gude",
		"details": "Arremesse uma bolinha de gude!",
		"level": "Level MAX",
		"prerequisite": ["marble5"],
		"type": "weapon",
		"key": "marble"
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
	"defense1": {
		"icon": ICON_PATH + "icon-armor.svg",
		"displayname": "Armadura",
		"details": "Diminui o dano causado em 3%!",
		"level": "Level 1",
		"prerequisite": [],
		"type": "stats",
		"key": "defense",
		"value": 0.03
	},
	"defense2": {
		"icon": ICON_PATH + "icon-armor.svg",
		"displayname": "Armadura",
		"details": "Diminui o dano causado em 3%!",
		"level": "Level 2",
		"prerequisite": ["defense1"],
		"type": "stats",
		"key": "defense",
		"value": 0.03
	},
	"defense3": {
		"icon": ICON_PATH + "icon-armor.svg",
		"displayname": "Armadura",
		"details": "Diminui o dano causado em 3%!",
		"level": "Level 3",
		"prerequisite": ["defense2"],
		"type": "stats",
		"key": "defense",
		"value": 0.03
	},
	"defense4": {
		"icon": ICON_PATH + "icon-armor.svg",
		"displayname": "Armadura",
		"details": "Diminui o dano causado em 3%!",
		"level": "Level 4",
		"prerequisite": ["defense3"],
		"type": "stats",
		"key": "defense",
		"value": 0.03
	},
	"defense5": {
		"icon": ICON_PATH + "icon-armor.svg",
		"displayname": "Armadura",
		"details": "Diminui o dano causado em 3%!",
		"level": "Level 5",
		"prerequisite": ["defense4"],
		"type": "stats",
		"key": "defense",
		"value": 0.03
	},
	"defense6": {
		"icon": ICON_PATH + "icon-armor.svg",
		"displayname": "Armadura",
		"details": "Diminui o dano causado em 4%!",
		"level": "Level MAX",
		"prerequisite": ["defense5"],
		"type": "stats",
		"key": "defense",
		"value": 0.04
	},
	"speed1": {
		"icon": ICON_PATH + "icon-speed.svg",
		"displayname": "Velocidade",
		"details": "Aumenta a velocidade de movimento!",
		"level": "Level 1",
		"prerequisite": [],
		"type": "stats",
		"key": "speed",
		"value": 1
	},
	"speed2": {
		"icon": ICON_PATH + "icon-speed.svg",
		"displayname": "Velocidade",
		"details": "Aumenta a velocidade de movimento!",
		"level": "Level 2",
		"prerequisite": ["speed1"],
		"type": "stats",
		"key": "speed",
		"value": 1
	},
	"speed3": {
		"icon": ICON_PATH + "icon-speed.svg",
		"displayname": "Velocidade",
		"details": "Aumenta a velocidade de movimento!",
		"level": "Level 3",
		"prerequisite": ["speed2"],
		"type": "stats",
		"key": "speed",
		"value": 2
	},
	"speed4": {
		"icon": ICON_PATH + "icon-speed.svg",
		"displayname": "Velocidade",
		"details": "Aumenta a velocidade de movimento!",
		"level": "Level 4",
		"prerequisite": ["speed3"],
		"type": "stats",
		"key": "speed",
		"value": 2
	},
	"speed5": {
		"icon": ICON_PATH + "icon-speed.svg",
		"displayname": "Velocidade",
		"details": "Aumenta a velocidade de movimento!",
		"level": "Level 5",
		"prerequisite": ["speed4"],
		"type": "stats",
		"key": "speed",
		"value": 3
	},
	"speed6": {
		"icon": ICON_PATH + "icon-speed.svg",
		"displayname": "Velocidade",
		"details": "Aumenta a velocidade de movimento ao máximo!",
		"level": "Level MAX",
		"prerequisite": ["speed5"],
		"type": "stats",
		"key": "speed",
		"value": 3
	},
	"strength1": {
		"icon": ICON_PATH + "icon-strength.svg",
		"displayname": "Força",
		"details": "Aumenta a força do ataque corpo a corpo!",
		"level": "Level 1",
		"prerequisite": [],
		"type": "stats",
		"key": "strength",
		"value": 0.5
	},
	"strength2": {
		"icon": ICON_PATH + "icon-strength.svg",
		"displayname": "Força",
		"details": "Aumenta a força do ataque corpo a corpo!",
		"level": "Level 2",
		"prerequisite": ["strength1"],
		"type": "stats",
		"key": "strength",
		"value": 0.5
	},
	"strength3": {
		"icon": ICON_PATH + "icon-strength.svg",
		"displayname": "Força",
		"details": "Aumenta a força do ataque corpo a corpo!",
		"level": "Level 3",
		"prerequisite": ["strength2"],
		"type": "stats",
		"key": "strength",
		"value": 0.5
	},
	"strength4": {
		"icon": ICON_PATH + "icon-strength.svg",
		"displayname": "Força",
		"details": "Aumenta a força do ataque corpo a corpo!",
		"level": "Level 4",
		"prerequisite": ["strength3"],
		"type": "stats",
		"key": "strength",
		"value": 0.5
	},
	"strength5": {
		"icon": ICON_PATH + "icon-strength.svg",
		"displayname": "Força",
		"details": "Aumenta a força do ataque corpo a corpo!",
		"level": "Level 5",
		"prerequisite": ["strength4"],
		"type": "stats",
		"key": "strength",
		"value": 0.5
	},
	"strength6": {
		"icon": ICON_PATH + "icon-strength.svg",
		"displayname": "Força",
		"details": "Aumenta a força do ataque corpo a corpo ao máximo!",
		"level": "Level MAX",
		"prerequisite": ["strength5"],
		"type": "stats",
		"key": "strength",
		"value": 0.5
	},
	"crit_chance1": {
		"icon": ICON_PATH + "icon-crit-chance.svg",
		"displayname": "Crítico",
		"details": "Aumenta a chance de crítico em 5%!",
		"level": "Level 1",
		"prerequisite": [],
		"type": "stats",
		"key": "crit_chance",
		"value": 0.05
	},
	"crit_chance2": {
		"icon": ICON_PATH + "icon-crit-chance.svg",
		"displayname": "Crítico",
		"details": "Aumenta a chance de crítico em 5%!",
		"level": "Level 2",
		"prerequisite": ["crit_chance1"],
		"type": "stats",
		"key": "crit_chance",
		"value": 0.05
	},
	"crit_chance3": {
		"icon": ICON_PATH + "icon-crit-chance.svg",
		"displayname": "Crítico",
		"details": "Aumenta a chance de crítico em 5%!",
		"level": "Level 3",
		"prerequisite": ["crit_chance2"],
		"type": "stats",
		"key": "crit_chance",
		"value": 0.05
	},
	"crit_chance4": {
		"icon": ICON_PATH + "icon-crit-chance.svg",
		"displayname": "Crítico",
		"details": "Aumenta a chance de crítico em 5%!",
		"level": "Level 4",
		"prerequisite": ["crit_chance3"],
		"type": "stats",
		"key": "crit_chance",
		"value": 0.05
	},
	"crit_chance5": {
		"icon": ICON_PATH + "icon-crit-chance.svg",
		"displayname": "Crítico",
		"details": "Aumenta a chance de crítico em 5%!",
		"level": "Level 5",
		"prerequisite": ["crit_chance4"],
		"type": "stats",
		"key": "crit_chance",
		"value": 0.05
	},
	"crit_chance6": {
		"icon": ICON_PATH + "icon-crit-chance.svg",
		"displayname": "Chance de Crítico",
		"details": "Aumenta a chance de crítico em 5%!",
		"level": "Level MAX",
		"prerequisite": ["crit_chance5"],
		"type": "stats",
		"key": "crit_chance",
		"value": 0.05
	},
	"crit_multiplier1": {
		"icon": ICON_PATH + "icon-crit-multiplier.svg",
		"displayname": "Multip. de Crítico",
		"details": "Aumenta o seu multiplicador em 5%!",
		"level": "Level 1",
		"prerequisite": [],
		"type": "stats",
		"key": "crit_multiplier",
		"value": 0.05
	},
	"crit_multiplier2": {
		"icon": ICON_PATH + "icon-crit-multiplier.svg",
		"displayname": "Multip. de Crítico",
		"details": "Aumenta o seu multiplicador em 5%!",
		"level": "Level 2",
		"prerequisite": ["crit_multiplier1"],
		"type": "stats",
		"key": "crit_multiplier",
		"value": 0.05
	},
	"crit_multiplier3": {
		"icon": ICON_PATH + "icon-crit-multiplier.svg",
		"displayname": "Multip. de Crítico",
		"details": "Aumenta o seu multiplicador em 5%!",
		"level": "Level 3",
		"prerequisite": ["crit_multiplier2"],
		"type": "stats",
		"key": "crit_multiplier",
		"value": 0.05
	},
	"crit_multiplier4": {
		"icon": ICON_PATH + "icon-crit-multiplier.svg",
		"displayname": "Multip. de Crítico",
		"details": "Aumenta o seu multiplicador em 5%!",
		"level": "Level 4",
		"prerequisite": ["crit_multiplier3"],
		"type": "stats",
		"key": "crit_multiplier",
		"value": 0.05
	},
	"crit_multiplier5": {
		"icon": ICON_PATH + "icon-crit-multiplier.svg",
		"displayname": "Multip. de Crítico",
		"details": "Aumenta o seu multiplicador em 5%!",
		"level": "Level 5",
		"prerequisite": ["crit_multiplier4"],
		"type": "stats",
		"key": "crit_multiplier",
		"value": 0.05
	},
	"crit_multiplie6": {
		"icon": ICON_PATH + "icon-crit-multiplier.svg",
		"displayname": "Multip. de Crítico",
		"details": "Aumenta o seu multiplicador em 5%!",
		"level": "Level MAX",
		"prerequisite": ["crit_multiplier5"],
		"type": "stats",
		"key": "crit_multiplier",
		"value": 0.05
	},
	"vampirism1": {
		"icon": ICON_PATH + "icon-vampirism.svg",
		"displayname": "Vampirismo",
		"details": "Ao atacar um inimigo, você tem 25% de chande de curar 3% do dano causado!",
		"level": "Level 1",
		"prerequisite": [],
		"type": "stats",
		"key": "vampirism",
		"value": 0.03
	},
	"vampirism2": {
		"icon": ICON_PATH + "icon-vampirism.svg",
		"displayname": "Vampirismo",
		"details": "Aumenta a cura do vampirismo em 3%!",
		"level": "Level 2",
		"prerequisite": ["vampirism1"],
		"type": "stats",
		"key": "vampirism",
		"value": 0.03
	},
	"vampirism3": {
		"icon": ICON_PATH + "icon-vampirism.svg",
		"displayname": "Vampirismo",
		"details": "Aumenta a cura do vampirismo em 3%!",
		"level": "Level 3",
		"prerequisite": ["vampirism2"],
		"type": "stats",
		"key": "vampirism",
		"value": 0.03
	},
	"vampirism4": {
		"icon": ICON_PATH + "icon-vampirism.svg",
		"displayname": "Vampirismo",
		"details": "Aumenta a cura do vampirismo em 3%!",
		"level": "Level 4",
		"prerequisite": ["vampirism3"],
		"type": "stats",
		"key": "vampirism",
		"value": 0.03
	},
	"vampirism5": {
		"icon": ICON_PATH + "icon-vampirism.svg",
		"displayname": "Vampirismo",
		"details": "Aumenta a cura do vampirismo em 3%!",
		"level": "Level 5",
		"prerequisite": ["vampirism4"],
		"type": "stats",
		"key": "vampirism",
		"value": 0.03
	},
	"vampirism6": {
		"icon": ICON_PATH + "icon-vampirism.svg",
		"displayname": "Vampirismo",
		"details": "Aumenta a cura do vampirismo em 4%!",
		"level": "Level MAX",
		"prerequisite": ["vampirism5"],
		"type": "stats",
		"key": "vampirism",
		"value": 0.04
	},
	"projectile1": {
		"icon": ICON_PATH + "icon-projectile.svg",
		"displayname": "Ataque Adicional",
		"details": "Adiciona um ataque a mais em todas as armas!",
		"level": "Level 1",
		"prerequisite": [],
		"type": "stats",
		"key": "projectile",
		"value": 1
	},
	"projectile2": {
		"icon": ICON_PATH + "icon-projectile.svg",
		"displayname": "Ataque Adicional",
		"details": "Adiciona um ataque a mais em todas as armas!",
		"level": "Level 2",
		"prerequisite": ["projectile1"],
		"type": "stats",
		"key": "projectile",
		"value": 1
	},
	"projectile3": {
		"icon": ICON_PATH + "icon-projectile.svg",
		"displayname": "Ataque Adicional",
		"details": "Adiciona um ataque a mais em todas as armas!",
		"level": "Level 3",
		"prerequisite": ["projectile2"],
		"type": "stats",
		"key": "projectile",
		"value": 1
	},
	"projectile4": {
		"icon": ICON_PATH + "icon-projectile.svg",
		"displayname": "Ataque Adicional",
		"details": "Adiciona um ataque a mais em todas as armas!",
		"level": "Level 4",
		"prerequisite": ["projectile3"],
		"type": "stats",
		"key": "projectile",
		"value": 1
	},
	"projectile5": {
		"icon": ICON_PATH + "icon-projectile.svg",
		"displayname": "Ataque Adicional",
		"details": "Adiciona um ataque a mais em todas as armas!",
		"level": "Level 5",
		"prerequisite": ["projectile4"],
		"type": "stats",
		"key": "projectile",
		"value": 1
	},
	"projectile6": {
		"icon": ICON_PATH + "icon-projectile.svg",
		"displayname": "Ataque Adicional",
		"details": "Adiciona um ataque a mais em todas as armas!",
		"level": "Level MAX",
		"prerequisite": ["projectile5"],
		"type": "stats",
		"key": "projectile",
		"value": 1
	},
	"projectile_size1": {
		"icon": ICON_PATH + "icon-projectilesize.svg",
		"displayname": "Ataques Maiores",
		"details": "Aumenta o tamanho de todas as armas!",
		"level": "Level 1",
		"prerequisite": [],
		"type": "stats",
		"key": "projectile_size",
		"value": 0.1
	},
	"projectile_size2": {
		"icon": ICON_PATH + "icon-projectilesize.svg",
		"displayname": "Ataques Maiores",
		"details": "Aumenta o tamanho de todas as armas!",
		"level": "Level 2",
		"prerequisite": ["projectile_size1"],
		"type": "stats",
		"key": "projectile_size",
		"value": 0.1
	},
	"projectile_size3": {
		"icon": ICON_PATH + "icon-projectilesize.svg",
		"displayname": "Ataques Maiores",
		"details": "Aumenta o tamanho de todas as armas!",
		"level": "Level 3",
		"prerequisite": ["projectile_size2"],
		"type": "stats",
		"key": "projectile_size",
		"value": 0.1
	},
	"projectile_size4": {
		"icon": ICON_PATH + "icon-projectilesize.svg",
		"displayname": "Ataques Maiores",
		"details": "Aumenta o tamanho de todas as armas!",
		"level": "Level 4",
		"prerequisite": ["projectile_size3"],
		"type": "stats",
		"key": "projectile_size",
		"value": 0.1
	},
	"projectile_size5": {
		"icon": ICON_PATH + "icon-projectilesize.svg",
		"displayname": "Ataques Maiores",
		"details": "Aumenta o tamanho de todas as armas!",
		"level": "Level 5",
		"prerequisite": ["projectile_size4"],
		"type": "stats",
		"key": "projectile_size",
		"value": 0.1
	},
	"projectile_size6": {
		"icon": ICON_PATH + "icon-projectilesize.svg",
		"displayname": "Ataques Maiores",
		"details": "Aumenta o tamanho de todas as armas ao máximo!",
		"level": "Level MAX",
		"prerequisite": ["projectile_size5"],
		"type": "stats",
		"key": "projectile_size",
		"value": 0.1
	},
	"attack_speed1": {
		"icon": ICON_PATH + "icon-attackspeed.svg",
		"displayname": "Velocidade de Ataque",
		"details": "Aumenta a velocidade de ataque de todos as armas!",
		"level": "Level 1",
		"prerequisite": [],
		"type": "stats",
		"key": "attack_speed",
		"value": 0.1
	},
	"attack_speed2": {
		"icon": ICON_PATH + "icon-attackspeed.svg",
		"displayname": "Velocidade de Ataque",
		"details": "Aumenta a velocidade de ataque de todos as armas!",
		"level": "Level 2",
		"prerequisite": ["attack_speed1"],
		"type": "stats",
		"key": "attack_speed",
		"value": 0.1
	},
	"attack_speed3": {
		"icon": ICON_PATH + "icon-attackspeed.svg",
		"displayname": "Velocidade de Ataque",
		"details": "Aumenta a velocidade de ataque de todos as armas!",
		"level": "Level 3",
		"prerequisite": ["attack_speed2"],
		"type": "stats",
		"key": "attack_speed",
		"value": 0.1
	},
	"attack_speed4": {
		"icon": ICON_PATH + "icon-attackspeed.svg",
		"displayname": "Velocidade de Ataque",
		"details": "Aumenta a velocidade de ataque de todos as armas!",
		"level": "Level 4",
		"prerequisite": ["attack_speed3"],
		"type": "stats",
		"key": "attack_speed",
		"value": 0.1
	},
	"attack_speed5": {
		"icon": ICON_PATH + "icon-attackspeed.svg",
		"displayname": "Velocidade de Ataque",
		"details": "Aumenta a velocidade de ataque de todos as armas!",
		"level": "Level 5",
		"prerequisite": ["attack_speed4"],
		"type": "stats",
		"key": "attack_speed",
		"value": 0.1
	},
	"attack_speed6": {
		"icon": ICON_PATH + "icon-attackspeed.svg",
		"displayname": "Velocidade de Ataque",
		"details": "Aumenta a velocidade de ataque de todos as armas ao máximo!",
		"level": "Level MAX",
		"prerequisite": ["attack_speed5"],
		"type": "stats",
		"key": "attack_speed",
		"value": 0.1
	},
	"collect_area_size1": {
		"icon": ICON_PATH + "icon-collect-area.svg",
		"displayname": "Alcance de coleta",
		"details": "Aumenta o alcance da coleta de XP em 5%!",
		"level": "Level 1",
		"prerequisite": [],
		"type": "stats",
		"key": "collect_area_size",
		"value": 0.1
	},
	"collect_area_size2": {
		"icon": ICON_PATH + "icon-collect-area.svg",
		"displayname": "Alcance de coleta",
		"details": "Aumenta o alcance da coleta de XP em 5%!",
		"level": "Level 2",
		"prerequisite": ["collect_area_size1"],
		"type": "stats",
		"key": "collect_area_size",
		"value": 0.1
	},
	"collect_area_size3": {
		"icon": ICON_PATH + "icon-collect-area.svg",
		"displayname": "Alcance de coleta",
		"details": "Aumenta o alcance da coleta de XP em 5%!",
		"level": "Level 3",
		"prerequisite": ["collect_area_size2"],
		"type": "stats",
		"key": "collect_area_size",
		"value": 0.1
	},
	"collect_area_size4": {
		"icon": ICON_PATH + "icon-collect-area.svg",
		"displayname": "Alcance de coleta",
		"details": "Aumenta o alcance da coleta de XP em 5%!",
		"level": "Level 4",
		"prerequisite": ["collect_area_size3"],
		"type": "stats",
		"key": "collect_area_size",
		"value": 0.1
	},
	"collect_area_size5": {
		"icon": ICON_PATH + "icon-collect-area.svg",
		"displayname": "Alcance de coleta",
		"details": "Aumenta o alcance da coleta de XP em 5%!",
		"level": "Level 5",
		"prerequisite": ["collect_area_size4"],
		"type": "stats",
		"key": "collect_area_size",
		"value": 0.1
	},
	"collect_area_size6": {
		"icon": ICON_PATH + "icon-collect-area.svg",
		"displayname": "Alcance de coleta",
		"details": "Aumenta o alcance da coleta de XP em 5%!",
		"level": "Level MAX",
		"prerequisite": ["collect_area_size5"],
		"type": "stats",
		"key": "collect_area_size",
		"value": 0.1
	},
	"food": {
		"icon": ICON_PATH + "icon-food.svg",
		"displayname": "Refeição",
		"details": "Restaura 10 de vida!",
		"level": "Consumível",
		"prerequisite": [],
		"type": "consumable",
		"value": 10
	}
}

const SHOP: Dictionary = {
	"bonus_health": {
		"icon": ICON_PATH + "icon-health.svg",
		"displayname": "Vida",
		"price": [200, 350, 500, 750, 1000],
		"value": 10,
		"max_level": 5
	},
	"bonus_defense": {
		"icon": ICON_PATH + "icon-armor.svg",
		"displayname": "Armadura",
		"price": [200, 350, 500, 750, 1000],
		"value": 0.01,
		"max_level": 5
	},
	"bonus_speed": {
		"icon": ICON_PATH + "icon-speed.svg",
		"displayname": "Velocidade",
		"price": [200, 350, 500, 750, 1000],
		"value": 1,
		"max_level": 5
	},
	"bonus_size": {
		"icon": ICON_PATH + "icon-projectilesize.svg",
		"displayname": "Tamanho",
		"price": [200, 350, 500, 750, 1000],
		"value": 0.05,
		"max_level": 5
	},
	"bonus_area_size": {
		"icon": ICON_PATH + "icon-collect-area.svg",
		"displayname": "Alcance",
		"price": [200, 350, 500, 750, 1000],
		"value": 0.05,
		"max_level": 5
	},
	"bonus_strength": {
		"icon": ICON_PATH + "icon-strength.svg",
		"displayname": "Força",
		"price": [200, 350, 500, 750, 1000],
		"value": 0.25,
		"max_level": 5
	},
	"bonus_attackspeed": {
		"icon": ICON_PATH + "icon-attackspeed.svg",
		"displayname": "AtkSpeed",
		"price": [200, 350, 500, 750, 1000],
		"value": 0.05,
		"max_level": 5
	},
	"bonus_crit_chance": {
		"icon": ICON_PATH + "icon-crit-chance.svg",
		"displayname": "CritChance",
		"price": [200, 350, 500, 750, 1000],
		"value": 0.01,
		"max_level": 5
	},
	"bonus_crit_multiplier": {
		"icon": ICON_PATH + "icon-crit-multiplier.svg",
		"displayname": "CritMult",
		"price": [200, 350, 500, 750, 1000],
		"value": 0.04,
		"max_level": 5
	},
	"bonus_vampirism": {
		"icon": ICON_PATH + "icon-vampirism.svg",
		"displayname": "Vampirismo",
		"price": [200, 350, 500, 750, 1000],
		"value": 0.01,
		"max_level": 5
	},
	"bonus_weapon": {
		"icon": ICON_PATH + "icon-extraweaponslot.svg",
		"displayname": "SlotArma",
		"price": [2500, 3000],
		"value": 1,
		"max_level": 2
	},
	"bonus_stat": {
		"icon": ICON_PATH + "icon-extrastatslot.svg",
		"displayname": "SlotStats",
		"price": [1000, 2500, 3000],
		"value": 1,
		"max_level": 3
	},
	"bonus_level": {
		"icon": ICON_PATH + "icon-extralevel.svg",
		"displayname": "Level",
		"price": [5000],
		"value": 1,
		"max_level": 1
	}
}

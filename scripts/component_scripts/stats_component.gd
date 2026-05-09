extends Node
class_name StatsComponent

var bonus_health: int = 0
var bonus_defense: float = 0
var bonus_speed: float = 0
var bonus_damage: float = 0
var bonus_crit_chance: float = 0.0
var bonus_crit_multiplier: float = 1.5
var bonus_vampirism: float = 0.0
var bonus_projectile: int = 0
var bonus_attack_speed: float = 0.0
var bonus_projectile_size: float = 1.0

signal update_stats

func _ready() -> void:
	apply_meta_upgrade()

func apply_stat_upgrade(data: Dictionary) -> void:
	match data["key"]:
		"health":
			bonus_health += data["value"]
			emit_signal("update_stats")
		"defense":
			bonus_defense += data["value"]
		"vampirism":
			bonus_vampirism += data["value"]
		"speed":
			bonus_speed += data["value"]
		"strength":
			bonus_damage += data["value"]
		"crit_chance":
			bonus_crit_chance += data["value"]
		"crit_multiplier":
			bonus_crit_multiplier += data["value"]
		"crit_multiplier":
			bonus_crit_multiplier += data["value"]
		"projectile":
			bonus_projectile += data["value"]
		"attack_speed":
			bonus_attack_speed += data["value"]
		"projectile_size":
			bonus_projectile_size += data["value"]

func apply_meta_upgrade() -> void:
	for i in SaveManager.meta_upgrades:
		var level = SaveManager.meta_upgrades[i]["level"]
		
		if level == 0:
			continue
		
		var value = SaveManager.meta_upgrades[i]["value"]
		match i:
			"bonus_health":
				bonus_health += value
				emit_signal("update_stats")
			"bonus_defense":
				bonus_defense += value
			"bonus_speed":
				bonus_speed += value
			"bonus_crit_chance":
				bonus_crit_chance += value
			"bonus_crit_multiplier":
				bonus_crit_multiplier += value
			"bonus_vampirism":
				bonus_vampirism += value
			"bonus_size":
				bonus_projectile_size += value
			"bonus_strength":
				bonus_damage += value

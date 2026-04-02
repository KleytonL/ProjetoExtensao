extends Node
class_name StatsComponent

var bonus_health: int = 0
var bonus_speed: int = 0
var bonus_damage: int = 0
var bonus_projectile: int = 0
var bonus_attack_speed: float = 0.0
var bonus_projectile_size: float = 1.0

func apply_stat_upgrade(data: Dictionary) -> void:
	match data["key"]:
		"speed":
			bonus_speed += data["value"]
		"strength":
			bonus_damage += data["value"]
		"projectile":
			bonus_projectile += data["value"]
		"projectile_size":
			bonus_projectile_size += data["value"]

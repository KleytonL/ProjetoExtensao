extends Node
class_name StatsComponent

var bonus_health: int = 0
var bonus_speed: float = 0
var bonus_damage: float = 0
var bonus_projectile: int = 0
var bonus_attack_speed: float = 0.0
var bonus_projectile_size: float = 1.0

signal update_stats

func apply_stat_upgrade(data: Dictionary) -> void:
	match data["key"]:
		"health":
			bonus_health += data["value"]
			emit_signal("update_stats")
		"speed":
			bonus_speed += data["value"]
		"strength":
			bonus_damage += data["value"]
		"projectile":
			bonus_projectile += data["value"]
		"attack_speed":
			bonus_attack_speed += data["value"]
		"projectile_size":
			bonus_projectile_size += data["value"]

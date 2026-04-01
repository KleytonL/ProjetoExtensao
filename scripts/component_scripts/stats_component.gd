extends Node
class_name StatsComponent

var bonus_health: int
var bonus_speed: int
var bonus_damage: int
var bonus_projectile: int
var bonus_attack_speed: float
var bonus_projectile_size: float

func apply_stat_upgrade(data: Dictionary) -> void:
	match data["key"]:
		"speed":
			bonus_speed += data["value"]
		"strenght":
			bonus_damage += data["value"]

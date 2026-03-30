extends Node
class_name UpgradeController

@export var player: Player

var _upgrades: Dictionary = {
	"soulfire": preload("res://scenes/character/weapon_soulfire.tscn"),
	"shield": preload("res://scenes/character/weapon_orbital_shield.tscn"),
	"boomerang": preload("res://scenes/character/weapon_boomerang.tscn")
}

var _active: Dictionary = {}

func handle_upgrade(item: String) -> void:
	var data = UpgradeDatabase.UPGRADES[item]

	if data["type"] == "weapon":
		var key = data["key"]
		if key in _active:
			_active[key].current_level += 1
		else:
			var instance = _upgrades[key].instantiate()
			player.call_deferred("add_child", instance)
			_active[key] = instance
#		"food":
#			health += 5
#			health = clamp(health, 0, max_health)

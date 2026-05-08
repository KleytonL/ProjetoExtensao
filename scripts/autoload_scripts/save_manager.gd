extends Node

const PATH: String = "user://save_data.json"

var levels_unlocked: Array[int] = [1]
var essences_collected: int = 0
var meta_upgrades: Dictionary = {
	"bonus_health": {
		"level": 0,
		"value": 0
	},
	"bonus_speed": {
		"level": 0,
		"value": 0
	},
	"bonus_size": {
		"level": 0,
		"value": 0
	},
	"bonus_strength": {
		"level": 0,
		"value": 0
	},
	"bonus_attackspeed": {
		"level": 0,
		"value": 0
	},
	"bonus_crit_chance": {
		"level": 0,
		"value": 0
	},
	"bonus_vampirism": {
		"level": 0,
		"value": 0
	},
	"bonus_level": {
		"level": 0,
		"value": 0
	},
	"bonus_weapon": {
		"level": 0,
		"value": 0
	},
	"bonus_stat": {
		"level": 0,
		"value": 0
	}
}
var weapons_capacity: int = 2
var stats_capacity: int = 2

func _ready() -> void:
	load_save()

func load_save() -> void:
	if not FileAccess.file_exists(PATH):
		return
	
	if FileAccess.file_exists(PATH):
		DirAccess.remove_absolute(PATH)
		return
	
	var file = FileAccess.open(PATH, FileAccess.READ)
	var data = JSON.parse_string(file.get_as_text())
	if data:
		levels_unlocked.assign(data.get("levels_unlocked", [1]))
		essences_collected = data.get("essences_collected", 0)
		meta_upgrades = data.get("meta_upgrades", {})
		weapons_capacity = data.get("weapons_capacity", 2)
		stats_capacity = data.get("stats_capacity", 2)

func save() -> void:
	var file = FileAccess.open(PATH, FileAccess.WRITE)
	file.store_string(
		JSON.stringify(
			{
			"levels_unlocked": levels_unlocked,
			"essences_collected": essences_collected,
			"meta_upgrades": meta_upgrades,
			"weapons_capacity": weapons_capacity,
			"stats_capacity": stats_capacity
			}
		)
	)

func unlock_level(level: int) -> void:
	if level not in levels_unlocked:
		levels_unlocked.append(level)
		save()

func set_essence(amount: int) -> void:
	essences_collected += amount
	save()

func set_weapons(amount: int) -> void:
	weapons_capacity = amount
	save()

func set_stats(amount: int) -> void:
	stats_capacity = amount
	save()

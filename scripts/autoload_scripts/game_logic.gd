extends Node

var can_pause: bool = true
var can_dash: bool = true
var max_weapons: int = 2
var max_stats: int = 2
var upgrades_collected: Array = []
var enemies_defeated: int = 0

func run_reset() -> void:
	upgrades_collected.clear()
	max_weapons = SaveManager.weapons_capacity
	max_stats = SaveManager.stats_capacity
	enemies_defeated = 0

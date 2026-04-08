extends Node

var can_pause: bool = true
var can_dash: bool = true
var max_weapons: int = 2
var max_stats: int = 2
var upgrades_collected: Array = []

func run_reset() -> void:
	upgrades_collected.clear()

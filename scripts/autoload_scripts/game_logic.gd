extends Node

var player: Player
var can_pause: bool = true
var can_dash: bool = true
var is_dead: bool = false
var max_weapons: int = 2
var max_stats: int = 2
var upgrades_collected: Array = []
var enemies_defeated: int = 0
var holding_essences: int = 0
var current_score: int = 0

func run_reset() -> void:
	upgrades_collected.clear()
	max_weapons = SaveManager.weapons_capacity
	max_stats = SaveManager.stats_capacity
	enemies_defeated = 0
	current_score = 0
	holding_essences = 0
	player = get_tree().get_first_node_in_group("Player")

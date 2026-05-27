extends Node2D
class_name LevelTwo

@onready var crate = preload("res://scenes/misc/crate.tscn")
var active_enemies: Array = []
var current_crates: int = 0

func _ready() -> void:
	spawn_crates()

func spawn_crates() -> void:
	while current_crates < 10:
		var new_crate = crate.instantiate()
		var x_pos = randf_range(16, 1584)
		var y_pos = randf_range(16, 1584)
		new_crate.global_position = Vector2(x_pos, y_pos)
		add_child(new_crate)
		current_crates += 1
	$CrateTimer.start()

func _on_crate_timer_timeout() -> void:
	spawn_crates()

func _on_level_timer_timeout() -> void:
	victory_condition()

func victory_condition() -> void:
	active_enemies = get_tree().get_nodes_in_group("Enemy").filter(
		func(e): return e.is_visible_on_screen
	)
	if active_enemies.size() != 0:
		$LevelTimer.start(1.0)
	else:
		SaveManager.unlock_level(3)
		$WorldGUI/victory_screen.pause(2)

extends Node2D
class_name LevelOne

@onready var crate = preload("res://scenes/misc/crate.tscn")
var current_crates: int = 0
var active_enemies: int

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
	active_enemies = get_tree().get_node_count_in_group("Enemy")
	victory_condition(active_enemies)

func victory_condition(enemies) -> void:
	if enemies != 0:
		$LevelTimer.start(1.0)
	else:
		SaveManager.set_weapons(3)
		SaveManager.unlock_level(2)
		$WorldGUI/VictoryScreen.pause()

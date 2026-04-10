extends Node2D
class_name LevelTwo

var active_enemies: int

func _on_level_timer_timeout() -> void:
	active_enemies = get_tree().get_node_count_in_group("Enemy")
	if active_enemies != 0:
		calculate_enemy_quantity()
	else:
		$WorldGUI/death_screen.pause()

func calculate_enemy_quantity() -> void:
	await get_tree().create_timer(1.0).timeout
	active_enemies = get_tree().get_node_count_in_group("Enemy")
	if active_enemies == 0:
		$WorldGUI/death_screen.pause()
		return
	calculate_enemy_quantity()

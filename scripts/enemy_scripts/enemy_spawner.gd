extends Node2D

@export var spawns: Array[Spawn_info] = []
@onready var player: Player = get_tree().get_first_node_in_group("Player")

var time: int = 0

func _on_timer_timeout() -> void:
	time += 1
	
	if get_tree().get_node_count_in_group("Enemy") >= 200:
		return
	
	for enemy in spawns:
		if time < enemy.time_start or time > enemy.time_end:
			continue
		
		if enemy.spawn_delay_counter <= enemy.enemy_spawn_delay:
			enemy.spawn_delay_counter += 1
			continue
		
		enemy.spawn_delay_counter = 0
		for i in enemy.enemy_num:
			var enemy_spawn = enemy.enemy.instantiate()
			enemy_spawn.global_position = get_random_position()
			add_child(enemy_spawn)


func get_random_position():
	var vpr = get_viewport_rect().size * randf_range(1.1,1.4)
	var top_left = Vector2(player.global_position.x - vpr.x/2, player.global_position.y - vpr.y/2)
	var top_right = Vector2(player.global_position.x + vpr.x/2, player.global_position.y - vpr.y/2)
	var bottom_left = Vector2(player.global_position.x - vpr.x/2, player.global_position.y + vpr.y/2)
	var bottom_right = Vector2(player.global_position.x + vpr.x/2, player.global_position.y + vpr.y/2)
	var pos_side = ["up", "down", "right", "left"].pick_random()
	var spawn_pos1 = Vector2.ZERO
	var spawn_pos2 = Vector2.ZERO
	
	match pos_side:
		"up":
			spawn_pos1 = top_left
			spawn_pos2 = top_right
		"down":
			spawn_pos1 = bottom_left
			spawn_pos2 = bottom_right
		"right":
			spawn_pos1 = top_right
			spawn_pos2 = bottom_right
		"left":
			spawn_pos1 = top_left
			spawn_pos2 = bottom_left
	
	var x_spawn = randf_range(spawn_pos1.x, spawn_pos2.x)
	var y_spawn = randf_range(spawn_pos1.y, spawn_pos2.y)
	
	return Vector2(x_spawn, y_spawn)

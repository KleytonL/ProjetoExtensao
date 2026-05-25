extends State
class_name PursuitState

@onready var player: Player = get_tree().get_first_node_in_group("Player")

func process_physics(delta: float) -> State:
	if player:
		var direction = parent.global_position.direction_to(player.global_position)
		parent.position += direction * move_speed * delta
		parent.sprite.scale.x = -1 if direction.x < 0 else 1
		if parent.position.distance_squared_to(player.position) > 80000:
			parent.queue_free()
	return null

extends State
class_name PursuitState

@onready var player: Player = get_tree().get_first_node_in_group("Player")

func process_physics(_delta: float) -> State:
	if player:
		var direction = parent.global_position.direction_to(player.global_position)
		parent.velocity = direction * move_speed
		parent.sprite.scale.x = -1 if parent.velocity.x < 0 else 1
	parent.move_and_slide()
	return null

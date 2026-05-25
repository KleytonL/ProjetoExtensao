extends State
class_name PursuitState

@onready var player: Player = get_tree().get_first_node_in_group("Player")

const separation_radius: float = 324.0
const separation_force: float = 0.005

func process_physics(delta: float) -> State:
	if player:
		var direction = parent.global_position.direction_to(player.global_position)
		
		var separation = Vector2.ZERO
		var neighbors = SpatialHash.get_neighbors(parent.global_position)
		
		for neighbor in neighbors:
			if neighbor == parent or not is_instance_valid(neighbor):
				continue
			var dist = parent.global_position.distance_squared_to(neighbor.global_position)
			if dist < separation_radius and dist > 0:
				separation += (parent.global_position - neighbor.global_position).normalized() * (separation_radius - dist)
		
		var final_direction = (direction + separation * separation_force).normalized()
		parent.position += final_direction * move_speed * delta
		parent.sprite.scale.x = -1 if direction.x < 0 else 1
		
		if parent.position.distance_squared_to(player.position) > 80000:
			parent.queue_free()
	return null

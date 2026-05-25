extends Node
class_name KnockbackComponent

@export var target: Node
@export var hurt_state: State
@export var resistence: float = 1.0
var knockback: Vector2

func apply_direction(attack_force: Vector2) -> void:
	knockback = attack_force / resistence
	if target.get("is_attacking"):
		if target.is_attacking:
			return
	target.state_machine.change_state(hurt_state)

extends Node
class_name KnockbackComponent

@export var target: CharacterBody2D
@export var hurt_state: State
@export var force: int
var knockback: Vector2

func apply_direction(attack_direction: Vector2) -> void:
	knockback = attack_direction * force
	target.state_machine.change_state(hurt_state)

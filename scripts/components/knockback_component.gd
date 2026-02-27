extends Node
class_name KnockbackComponent

@export var target: CharacterBody2D
@export var force: int
var knockback: Vector2

func apply(attack_direction: Vector2) -> void:
	knockback = attack_direction * force
	print(knockback)

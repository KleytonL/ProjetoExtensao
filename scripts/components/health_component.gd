extends Node
class_name HealthComponent

@export var max_health: int
var health: int

signal update_healthbar

func _ready() -> void:
	health = max_health

func take_damage(attack: int) -> void:
	health -= attack
	emit_signal("update_healthbar")
	if health <= 0:
		get_tree().paused = true

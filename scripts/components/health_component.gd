extends Node
class_name HealthComponent

@export var max_health: int
var health: int

signal update_healthbar

func _ready() -> void:
	health = max_health

func damage_enemy(attack: int) -> void:
	health -= attack
	$sfx_damage.play()
	if health <= 0:
		get_parent().queue_free()

func damage_player(attack: int) -> void:
	health -= attack
	$sfx_damage.play()
	emit_signal("update_healthbar")
	if health <= 0:
		get_tree().paused = true

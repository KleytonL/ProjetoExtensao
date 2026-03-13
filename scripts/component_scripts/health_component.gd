extends Node
class_name HealthComponent

@export var death_state: State
@export var max_health: int
var health: int
@onready var morte = get_tree().get_first_node_in_group("Teste")

signal update_healthbar

func _ready() -> void:
	health = max_health

func damage_enemy(attack: int) -> void:
	health -= attack
	$sfx_damage.play()
	if health <= 0:
		$"../StateMachine".change_state(death_state)

func damage_player(attack: int) -> void:
	health -= attack
	$sfx_damage.play()
	emit_signal("update_healthbar")
	if health <= 0:
		morte.pause()

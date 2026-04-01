extends Node
class_name EnemyHealthComponent

@export var death_state: State
@export var max_health: int
var health: int

func _ready() -> void:
	health = max_health

func damage(attack: int) -> void:
	health -= attack
	$sfx_damage.play()
	if health <= 0:
		$"../StateMachine".change_state(death_state)

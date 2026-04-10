extends Node
class_name EnemyHealthComponent

@export var death_state: State
@export var max_health: float
var health: float

func _ready() -> void:
	health = max_health

func damage(attack: float) -> void:
	health -= attack
	$sfx_damage.play()
	if health <= 0:
		if get_parent() is Crate:
			get_parent().destroy()
		elif get_parent() is EnemyNeuryProjectile:
			get_parent().queue_free()
		else: 
			$"../StateMachine".change_state(death_state)

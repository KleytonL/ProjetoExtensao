extends Node
class_name EnemyHealthComponent

const damage_number = preload("res://scenes/misc/gui/damage_number.tscn")

@export var death_state: State
@export var max_health: float
var health: float

func _ready() -> void:
	health = max_health

func damage(attack: PlayerHitboxComponent) -> void:
	health -= attack.damage
	$sfx_damage.play()
	
	spawn_damage_number(attack)
	
	if health <= 0:
		if get_parent() is Crate:
			get_parent().destroy()
		elif get_parent() is EnemyNeuryProjectile:
			get_parent().queue_free()
		else: 
			$"../StateMachine".change_state(death_state)

func spawn_damage_number(attack: PlayerHitboxComponent) -> void:
	var number: DamageNumber = damage_number.instantiate()
	var offset: Vector2 = Vector2(randf_range(-6, 6), randf_range(-12, 12))
	
	number.position = owner.global_position + offset
	
	get_tree().current_scene.add_child(number)
	number.setup(attack.damage, attack.is_crit)

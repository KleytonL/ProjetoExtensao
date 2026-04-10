extends State
class_name EnemyAttackState

@export var attack_range: EnemyAttackRangeComponent
@export var pursuit_state: PursuitState
@export var knockback_component: KnockbackComponent

@onready var _attack_projectile = preload("res://scenes/enemies/enemy_projectile.tscn")
@onready var _neury = preload("res://scenes/enemies/enemy_neury_projectile.tscn")

func enter() -> void:
	super()
	parent.velocity = Vector2.ZERO
	await get_tree().create_timer(1.0).timeout
	release_attack()
	parent.velocity = knockback_component.knockback

func exit() -> void:
	$"../../AttackTimer".start()

func process_physics(_delta: float) -> State:
	if not parent.animations.is_playing():
		return pursuit_state
	return null

func release_attack() -> void:
	var projectile
	var direction: Vector2 = parent.global_position.direction_to(attack_range.get_player_position())
	
	if parent is EnemyDemonHand:
		projectile = _attack_projectile.instantiate()
		projectile.projectile_target = attack_range.get_player_position()
		projectile.position = parent.global_position + direction * 8
		get_tree().current_scene.add_child(projectile)
	
	if parent is EnemyNeuroMachine:
		var neury_count = 2
		for i in neury_count:
			projectile = _neury.instantiate()
			projectile.projectile_target = attack_range.get_player()
			projectile.position = parent.global_position + direction * (8 * i)
			get_tree().current_scene.add_child(projectile)

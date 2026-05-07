extends State
class_name EnemyAttackState

@export var attack_range: EnemyAttackRangeComponent
@export var pursuit_state: PursuitState
@export var await_time: float

@onready var _attack_projectile = preload("res://scenes/enemies/enemy_projectile.tscn")
@onready var _neury = preload("res://scenes/enemies/enemy_neury_projectile.tscn")

var cached_target: Vector2

func enter() -> void:
	super()
	parent.is_attacking = true
	parent.velocity = Vector2.ZERO
	cached_target = attack_range.get_player_position()
	await get_tree().create_timer(await_time).timeout
	release_attack()

func exit() -> void:
	parent.is_attacking = false
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
		var perpendicular = Vector2(-direction.y, direction.x)
		var offset = [perpendicular, -perpendicular]
		for i in 2:
			await get_tree().create_timer(0.25 * i).timeout
			if attack_range.get_player() == null:
				break
			projectile = _neury.instantiate()
			projectile.projectile_target = attack_range.get_player()
			projectile.position = parent.global_position + offset[i] * 8
			projectile.projectile_spawn_direction = offset[i]
			get_tree().current_scene.add_child(projectile)

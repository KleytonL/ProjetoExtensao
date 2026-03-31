extends State
class_name EnemyAttackState

@export var attack_range: EnemyAttackRangeComponent
@export var pursuit_state: PursuitState
@export var knockback_component: KnockbackComponent

@onready var attack_projectile = preload("res://scenes/enemies/enemy_projectile.tscn")

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
	var projectile: EnemyProjectile = attack_projectile.instantiate()
	var target: Vector2 = attack_range.get_player_position()
	var direction: Vector2 = parent.global_position.direction_to(target)
	projectile.position = parent.global_position + direction * 8
	projectile.projectile_target = target
	knockback_component.apply_knockback_only(target)
	projectile.projectile_speed = 30
	projectile.knockback = 5
	get_tree().current_scene.add_child(projectile)

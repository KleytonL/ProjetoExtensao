extends EnemyHitboxComponent
class_name EnemyNeuryProjectile

var projectile_speed: int = 45
var projectile_target: Player
var projectile_direction: Vector2 = Vector2.ZERO
var projectile_spawn_direction: Vector2 = Vector2.ZERO
var can_pursuit: bool = false

func _ready() -> void:
	projectile_direction = projectile_spawn_direction
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.0, 1.0), 0.5)
	tween.set_trans(Tween.TRANS_QUINT)
	tween.play()
	await tween.finished
	can_pursuit = true

func _physics_process(delta: float) -> void:
	if can_pursuit:
		var player_direction = position.direction_to(projectile_target.global_position)
		projectile_direction = projectile_direction.lerp(player_direction, 0.08)
	rotation = projectile_direction.angle()
	position += projectile_speed * projectile_direction * delta

func _on_area_entered(area: Area2D) -> void:
	super(area)
	if area is PlayerHurtboxComponent:
		queue_free()

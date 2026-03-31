extends EnemyHitboxComponent
class_name EnemyProjectile

var projectile_speed: int
var knockback: int

var projectile_angle: Vector2 = Vector2.ZERO
var projectile_target: Vector2 = Vector2.ZERO

func _ready() -> void:
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1, 1), 0.25)
	tween.set_trans(Tween.TRANS_ELASTIC)
	tween.play()
	projectile_angle = global_position.direction_to(projectile_target)
	rotation = projectile_angle.angle() + deg_to_rad(45)

func _physics_process(delta: float) -> void:
	position += projectile_angle * projectile_speed * delta

func _on_duration_timer_timeout() -> void:
	queue_free()

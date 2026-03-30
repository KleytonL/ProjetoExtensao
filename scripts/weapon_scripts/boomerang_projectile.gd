extends PlayerHitboxComponent
class_name BoomerangProjectile

var projectile_speed: float
var projectile_acceleration: float
var projectile_size: float
var knockback: int

var projectile_angle: Vector2 = Vector2.ZERO
var projectile_target: Vector2 = Vector2.ZERO

func _ready() -> void:
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(0.75, 0.75) * projectile_size, 0.75).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	tween.play()
	projectile_angle = global_position.direction_to(projectile_target)
	rotation = projectile_angle.angle() + deg_to_rad(45)

func _physics_process(delta: float) -> void:
	projectile_speed -= projectile_acceleration * delta
	position += projectile_angle * projectile_speed * delta

func _on_duration_timer_timeout() -> void:
	queue_free()

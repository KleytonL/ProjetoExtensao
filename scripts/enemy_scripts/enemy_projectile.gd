extends EnemyHitboxComponent
class_name EnemyProjectile

var projectile_speed: int
var knockback: int

var projectile_angle: Vector2 = Vector2.ZERO
var projectile_target: Vector2 = Vector2.ZERO

func _ready() -> void:
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(0.75, 0.75), 0.25)
	tween.set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_IN)
	tween.play()
	$AfterImageComponent.start(0.1, 0.25)
	projectile_angle = global_position.direction_to(projectile_target)
	rotation = projectile_angle.angle() + deg_to_rad(45)

func _physics_process(delta: float) -> void:
	position += projectile_angle * projectile_speed * delta

func _on_duration_timer_timeout() -> void:
	$AfterImageComponent.stop()
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(0.1, 0.1), 0.25)
	tween.set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_IN)
	tween.play()
	await tween.finished
	queue_free()

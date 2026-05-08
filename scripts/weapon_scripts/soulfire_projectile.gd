extends PlayerHitboxComponent
class_name SoulfireProjectile

var health: int
var projectile_speed: int
var projectile_size: float
var knockback: int

var projectile_angle: Vector2 = Vector2.ZERO
var projectile_target: Vector2 = Vector2.ZERO

func _ready() -> void:
	super()
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1, 1) * projectile_size, 0.75).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	tween.play()
	projectile_angle = global_position.direction_to(projectile_target)
	rotation = projectile_angle.angle() + deg_to_rad(45)

func _physics_process(delta: float) -> void:
	position += projectile_angle * projectile_speed * delta

func _on_area_entered(area: Area2D) -> void:
	super(area)
	if area is EnemyHurtboxComponent:
		health -= 1
		if health <= 0:
			queue_free()

func _on_duration_timer_timeout() -> void:
	queue_free()

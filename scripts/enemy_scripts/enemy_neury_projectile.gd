extends EnemyHitboxComponent
class_name EnemyNeuryProjectile

var projectile_speed: int = 45
var projectile_target: Player
var projectile_direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(0.75, 0.75), 0.25)
	tween.set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_IN)
	tween.play()

func _physics_process(delta: float) -> void:
	projectile_direction = position.direction_to(projectile_target.global_position)
	rotation = projectile_direction.angle()
	position += projectile_speed * projectile_direction * delta

func _on_area_entered(area: Area2D) -> void:
	super(area)
	if area is PlayerHurtboxComponent:
		queue_free()

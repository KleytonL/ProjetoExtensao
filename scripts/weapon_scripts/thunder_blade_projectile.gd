extends PlayerHitboxComponent
class_name ThunderBladeProjectile

var projectile_size: float

func _ready() -> void:
	$AnimatedSprite2D.play("spawn_animation")
	await $AnimatedSprite2D.animation_finished
	$CollisionShape2D.disabled = false
	$AnimatedSprite2D.play("on_ground_animation")

func _on_duration_timer_timeout() -> void:
	$CollisionShape2D.disabled = true
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(0.1, 0.1) * projectile_size, 0.75)
	tween.set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	tween.play()
	await tween.finished
	queue_free()

extends PlayerHitboxComponent
class_name SpearThrust

var angle: float
var duration: float
var knockback: int
var spear_size: float

func _ready() -> void:
	var tween = create_tween()
	position = Vector2(8, 0).rotated(angle)
	rotation = angle + deg_to_rad(45)
	tween.tween_property(self, "scale", Vector2(0.5, 0.5) * spear_size, 0.25).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_IN)
	tween.play()
	$DurationTimer.wait_time = duration
	$DurationTimer.start()

func _on_duration_timer_timeout() -> void:
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(0.1, 0.1), 0.5).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_IN)
	tween.play()
	await tween.finished
	queue_free()

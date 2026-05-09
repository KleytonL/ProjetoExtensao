extends PlayerHitboxComponent
class_name BlazingGround

var projectile_size: float
var knockback: int

func _ready() -> void:
	super()
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1, 1) * projectile_size, 0.75).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	tween.play()

func _on_tick_timer_timeout() -> void:
	for area in get_overlapping_areas():
		_on_area_entered(area)

func _on_duration_timer_timeout() -> void:
	queue_free()

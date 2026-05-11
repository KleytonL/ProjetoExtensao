extends PlayerHitboxComponent
class_name Radiance

var area_size: float
var tick_speed: float
var knockback: int

func _ready() -> void:
	super()
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2.ONE * area_size, 0.75).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	tween.play()
	await tween.finished
	update_stats()

func _process(delta: float) -> void:
	$AnimatedSprite2D.rotation += delta

func update_stats() -> void:
	_base_damage = damage
	self.scale = Vector2.ONE * area_size
	$TickTimer.wait_time = tick_speed

func _on_tick_timer_timeout() -> void:
	for area in get_overlapping_areas():
		_on_area_entered(area)

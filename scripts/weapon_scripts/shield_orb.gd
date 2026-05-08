extends PlayerHitboxComponent
class_name ShieldOrb

@export var after_image_component: AfterImageComponent

var angle: float
var duration: int
var knockback: int
var orb_size: float
var rotation_speed: float = 1.5
var orbit_radius: int = 25

signal on_orb_duration_timeout

func _ready() -> void:
	super()
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1, 1) * orb_size, 0.5).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	tween.play()
	$DurationTimer.wait_time = duration
	$DurationTimer.start()
	after_image_component.start(0.05, 0.1)

func _physics_process(delta: float) -> void:
	angle += rotation_speed * delta
	position = Vector2(orbit_radius, 0).rotated(angle)

func _on_duration_timer_timeout() -> void:
	after_image_component.stop()
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(0.1, 0.1), 0.5).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_IN)
	tween.play()
	on_orb_duration_timeout.emit()
	await tween.finished
	queue_free()

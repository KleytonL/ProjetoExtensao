extends PlayerHitboxComponent
class_name ShieldOrb

var angle: float
var duration: int
var knockback: int
var rotation_speed: float = 1.5
var orbit_radius: int = 25

signal on_orb_duration_timeout

func _ready() -> void:
	$DurationTimer.wait_time = duration
	$DurationTimer.start()

func _physics_process(delta: float) -> void:
	angle += rotation_speed * delta
	position = Vector2(orbit_radius, 0).rotated(angle)

func _on_duration_timer_timeout() -> void:
	on_orb_duration_timeout.emit()
	queue_free()

extends Camera2D
class_name CameraShake

@export var max_shake: float = 1.5
@export var shake_fade: float = 20.0

var _shake_strength: float = 0.0

func _process(delta: float) -> void:
	if _shake_strength > 0:
		_shake_strength = lerp(_shake_strength, 0.0, shake_fade * delta)
		var _y_strength = randf_range(-_shake_strength, _shake_strength)
		var _x_strength = randf_range(-_shake_strength, _shake_strength)
		offset = Vector2(_x_strength, _y_strength)

func shake_camera() -> void:
	_shake_strength = max_shake

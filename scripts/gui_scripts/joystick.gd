extends Node2D
class_name Joystick

var position_vector: Vector2

func _process(_delta: float) -> void:
	if not UserConfig.is_mobile:
		return
	_inject_input("ui_right", max(position_vector.x, 0))
	_inject_input("ui_left", max(-position_vector.x, 0))
	_inject_input("ui_down", max(position_vector.y, 0))
	_inject_input("ui_up", max(-position_vector.y, 0))

func _inject_input(action: String, strength: float) -> void:
	var event = InputEventAction.new()
	event.action = action
	event.pressed = strength > 0
	event.strength = strength
	Input.parse_input_event(event)

func reset() -> void:
	$Knob.pressing = false
	$Knob.touch_index = -1

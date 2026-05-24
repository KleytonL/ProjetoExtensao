extends Sprite2D
class_name Knob

var pressing: bool = false
var touch_index: int = -1
var max_length: float = 16
var deadzone: float = 0.1

func _ready() -> void:
	max_length *= get_parent().scale.x

func _process(delta: float) -> void:
	if not pressing:
		global_position = lerp(global_position, get_parent().global_position, delta*25)
		get_parent().position_vector = Vector2.ZERO

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.pressed:
			if touch_index == -1 and event.position.distance_to(get_parent().global_position) <= max_length * 2.5:
				touch_index = event.index
				pressing = true
		else:
			if event.index == touch_index:
				touch_index = -1
				pressing = false
	elif event is InputEventScreenDrag:
		if event.index != touch_index:
			return
		var touch_pos = event.position
		if touch_pos.distance_to(get_parent().global_position) <= max_length:
			global_position = touch_pos
		else:
			var angle = get_parent().global_position.angle_to_point(touch_pos)
			global_position.x = get_parent().global_position.x + cos(angle) * max_length
			global_position.y = get_parent().global_position.y + sin(angle) * max_length
		calculate_vector()

func calculate_vector() -> void:
	if abs((global_position.x - get_parent().global_position.x)) >= deadzone:
		get_parent().position_vector.x = (global_position.x - get_parent().global_position.x)/max_length
	else:
		get_parent().position_vector.x = 0.0
	
	if abs((global_position.y - get_parent().global_position.y)) >= deadzone:
		get_parent().position_vector.y = (global_position.y - get_parent().global_position.y)/max_length
	else:
		get_parent().position_vector.y = 0.0

func _on_button_button_down() -> void:
	pressing = true

func _on_button_button_up() -> void:
	pressing = false

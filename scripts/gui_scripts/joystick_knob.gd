extends Sprite2D
class_name Knob

var pressing: bool = false

@export var max_length: float = 16
@export var deadzone: float = 0.1

func _ready() -> void:
	max_length *= get_parent().scale.x

func _process(delta: float) -> void:
	if pressing:
		if get_global_mouse_position().distance_to(get_parent().global_position) <= max_length:
			global_position = get_global_mouse_position()
		else:
			var angle = get_parent().global_position.angle_to_point(get_global_mouse_position())
			global_position.x = get_parent().global_position.x + cos(angle) * max_length
			global_position.y = get_parent().global_position.y + sin(angle) * max_length
		calculate_vector()
	else:
		global_position = lerp(global_position, get_parent().global_position, delta*25)
		get_parent().position_vector = Vector2.ZERO

func calculate_vector() -> void:
	if abs((global_position.x - get_parent().global_position.x)) >= deadzone:
		get_parent().position_vector.x = (global_position.x - get_parent().global_position.x)/max_length
	if abs((global_position.y - get_parent().global_position.y)) >= deadzone:
		get_parent().position_vector.y = (global_position.y - get_parent().global_position.y)/max_length

func _on_button_button_down() -> void:
	pressing = true

func _on_button_button_up() -> void:
	pressing = false

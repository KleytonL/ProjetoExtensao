extends State
class_name DashState

@export var idle_state: State
@export var move_state: State
@export var iframes_component: iFramesComponent

func enter() -> void:
	super()
	iframes_component.activate_iframes(1.5)
	calculate_movement()

func process_physics(_delta: float) -> State:
	if not parent.animations.is_playing():
		if Input.get_axis("ui_left", "ui_right") or Input.get_axis("ui_up", "ui_down"):
			return move_state
		return idle_state
	
	parent.move_and_slide()
	return null

func calculate_movement() -> void:
	var direction_x := Input.get_axis("ui_left", "ui_right")
	var direction_y := Input.get_axis("ui_up", "ui_down")
	
	if parent.velocity == Vector2.ZERO:
		parent.velocity = Vector2(move_speed*3, 0) if parent.sprite.scale.x == 1 else Vector2(-move_speed*3, 0)
	elif parent.velocity != Vector2.ZERO:
		parent.velocity = Vector2(direction_x * (move_speed * 3), direction_y * (move_speed * 3))

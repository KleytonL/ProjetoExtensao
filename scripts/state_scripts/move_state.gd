extends State
class_name MoveState

@export var idle_state: State
@export var dash_state: State
@export var attack_state: State

func enter() -> void:
	super()

func process_input(_event: InputEvent) -> State:
	if Input.is_action_just_pressed("ui_dash"):
		return dash_state
	if Input.is_action_just_pressed("ui_attack"):
		return attack_state
	return null

func process_physics(_delta: float) -> State:
	var direction_x := Input.get_axis("ui_left", "ui_right")
	var direction_y := Input.get_axis("ui_up", "ui_down")
	
	parent.sprite.scale.x = -1 if parent.velocity.x < 0 else 1
	
	if direction_x:
		parent.velocity.x = direction_x * move_speed
	else:
		parent.velocity.x = move_toward(parent.velocity.x, 0, 200 * _delta)
	
	if direction_y:
		parent.velocity.y = direction_y * move_speed
	else:
		parent.velocity.y = move_toward(parent.velocity.y, 0, 200 * _delta)
	parent.move_and_slide()
	
	if !direction_x and !direction_y:
		if parent.velocity == Vector2.ZERO:
			return idle_state
	
	return null

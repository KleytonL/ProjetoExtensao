extends State
class_name IdleState

@export var move_state: State
@export var dash_state: State
@export var attack_state: State

func enter() -> void:
	super()
	parent.velocity = Vector2.ZERO

func process_input(_event: InputEvent) -> State:
	if Input.get_axis("ui_left", "ui_right") || Input.get_axis("ui_down", "ui_up"):
		return move_state
	if Input.is_action_just_pressed("ui_attack"):
		return attack_state
	if Input.is_action_just_pressed("ui_dash") and GameLogic.can_dash:
		return dash_state
	return null

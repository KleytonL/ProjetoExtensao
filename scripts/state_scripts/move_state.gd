extends State
class_name MoveState

@export var idle_state: State
@export var dash_state: State
@export var attack_state: State
@export var stats_component: StatsComponent

func enter() -> void:
	super()

func process_input(_event: InputEvent) -> State:
	if Input.is_action_just_pressed("ui_dash") and GameLogic.can_dash:
		return dash_state
	if Input.is_action_just_pressed("ui_attack"):
		return attack_state
	return null

func process_physics(_delta: float) -> State:
	var direction_x: float = Input.get_axis("ui_left", "ui_right")
	var direction_y: float = Input.get_axis("ui_up", "ui_down")
	
	var direction: Vector2 = Vector2(direction_x, direction_y).normalized()
	
	if direction.x:
		parent.velocity.x = direction.x * (move_speed + stats_component.bonus_speed)
		parent.sprite.flip_h = true if parent.velocity.x < 0 else false
	else:
		parent.velocity.x = move_toward(parent.velocity.x, 0, 200 * _delta)
	
	if direction.y:
		parent.velocity.y = direction.y * (move_speed + stats_component.bonus_speed)
	else:
		parent.velocity.y = move_toward(parent.velocity.y, 0, 200 * _delta)
	parent.move_and_slide()
	
	if !direction.x and !direction.y:
		if parent.velocity == Vector2.ZERO:
			return idle_state
	
	return null

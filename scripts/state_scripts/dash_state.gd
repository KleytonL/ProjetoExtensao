extends State
class_name DashState

@export var idle_state: State
@export var move_state: State
@export var iframes_component: iFramesComponent
@export var after_image_component: AfterImageComponent
@export var dash_update: DashProgress

var dash_speed: int = 75

func enter() -> void:
	iframes_component.activate_iframes(1.5)
	super()
	calculate_movement()

func exit() -> void:
	after_image_component.stop()

func process_physics(_delta: float) -> State:
	if not parent.animations.is_playing():
		if Input.get_axis("ui_left", "ui_right") or Input.get_axis("ui_up", "ui_down"):
			return move_state
		return idle_state
	parent.move_and_slide()
	return null

func calculate_movement() -> void:
	dash_update.update_progress()
	after_image_component.start(0.05, 0.75)
	var direction_x: float = Input.get_axis("ui_left", "ui_right")
	var direction_y: float = Input.get_axis("ui_up", "ui_down")
	
	var direction: Vector2 = Vector2(direction_x, direction_y).normalized()
	
	if !direction.x and !direction.y:
		parent.velocity = Vector2(-dash_speed*3, 0) if parent.sprite.flip_h else Vector2(dash_speed*3, 0)
	elif direction.x or direction.y:
		parent.velocity = Vector2(direction.x * (dash_speed * 2.5), direction.y * (dash_speed * 2.5))

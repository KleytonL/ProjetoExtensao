extends State
class_name HurtState

@export var idle_state: State
@export var move_state: State
@export var knockback_component: KnockbackComponent
@export var iframes_component: iFramesComponent

func enter() -> void:
	super()
	parent.velocity = knockback_component.knockback
	await parent.animations.animation_finished
	parent.velocity = Vector2.ZERO

func process_input(_event: InputEvent) -> State:
	if not parent.animations.is_playing():
		if Input.get_axis("ui_left", "ui_right") or Input.get_axis("ui_up", "ui_down"):
			return move_state
	return null

func process_physics(_delta: float) -> State:
	if iframes_component:
		iframes_component.activate_iframes(0.5)

	if parent.velocity == Vector2.ZERO:
		return idle_state
	
	parent.move_and_slide()
	return null

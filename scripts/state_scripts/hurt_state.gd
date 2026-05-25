extends State
class_name HurtState

@export var idle_state: State
@export var move_state: State
@export var knockback_component: KnockbackComponent
@export var iframes_component: iFramesComponent

func enter() -> void:
	super()
	if parent is CharacterBody2D:
		parent.velocity = knockback_component.knockback
		await parent.animations.animation_finished
		parent.velocity = Vector2.ZERO

func process_input(_event: InputEvent) -> State:
	if not parent.animations.is_playing():
		if Input.get_axis("ui_left", "ui_right") or Input.get_axis("ui_up", "ui_down"):
			return move_state
	return null

func process_physics(delta: float) -> State:
	if iframes_component:
		iframes_component.activate_iframes(1)
	
	if parent is CharacterBody2D:
		if parent.velocity == Vector2.ZERO:
			return idle_state
		parent.move_and_slide()
	else:
		parent.position += knockback_component.knockback * delta
		knockback_component.knockback = knockback_component.knockback.lerp(Vector2.ZERO, delta * 4.5)
		if knockback_component.knockback.length() < 1.0:
			knockback_component.knockback = Vector2.ZERO
			return idle_state

	return null

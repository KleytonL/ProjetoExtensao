extends State
class_name HurtState

@export var recovery_state: State
@export var knockback_component: KnockbackComponent
@export var iframes_component: iFramesComponent

func enter() -> void:
	super()
	parent.velocity = knockback_component.knockback
	await parent.animations.animation_finished
	parent.velocity = Vector2.ZERO

func process_physics(_delta: float) -> State:
	if iframes_component:
		iframes_component.activate_iframes(0.5)

	if parent.velocity == Vector2.ZERO:
		return recovery_state
	
	parent.move_and_slide()
	return null

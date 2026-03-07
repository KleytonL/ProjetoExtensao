extends State
class_name AttackState

@export var idle_state: State
@export var next_attack: State
@export var hitbox_component: PlayerHitboxComponent

var attack_buffer: bool
var combo_window: bool
var animation_finished: bool

func enter() -> void:
	super()
	attack_buffer = false
	combo_window = false
	animation_finished = false
	hitbox_component.monitoring = true

func exit() -> void:
	hitbox_component.monitoring = false

func process_input(_event: InputEvent) -> State:
	if Input.is_action_just_pressed("ui_attack"):
		attack_buffer = true
	return null

func process_physics(_delta: float) -> State:
	if not parent.animations.is_playing():
		animation_finished = true
	
	if animation_finished:
		if attack_buffer and next_attack:
			return next_attack
		
		return idle_state
	
	parent.move_and_slide()
	
	return null

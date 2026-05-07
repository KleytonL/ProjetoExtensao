extends State
class_name AttackState

@export var idle_state: State
@export var move_state: State
@export var next_attack: State
@export var hitbox_component: PlayerHitboxComponent

const ATTACK_OFFSET: Vector2 = Vector2(12, 0)
const ATTACK_LEAP: int = 40

var attack_direction: Vector2
var attack_shape: CollisionShape2D
var attack_buffer: bool
var input_window: bool

func enter() -> void:
	super()
	attack_buffer = false
	input_window = false
	hitbox_component.monitoring = true
	attack_direction = apply_attack_direction()
	apply_shape_direction()
	if attack_direction.x != 0:
		parent.sprite.flip_h = attack_direction.x < 0

func exit() -> void:
	hitbox_component.monitoring = false
	attack_shape.position = ATTACK_OFFSET
	attack_shape.rotation = 0.0

func apply_attack_direction() -> Vector2:
	var h: float = Input.get_axis("ui_left", "ui_right") 
	var v: float = Input.get_axis("ui_up", "ui_down") 
	var input: Vector2 = Vector2(h, v)

	if input == Vector2.ZERO:
		return Vector2(-1 if parent.sprite.flip_h else 1, 0)

	var angle: float = snappedf(input.angle(), PI / 4)
	return Vector2.from_angle(angle).normalized()

func apply_shape_direction() -> void:
	attack_shape = hitbox_component.get_child(0)
	attack_shape.position = attack_direction * ATTACK_OFFSET.x
	attack_shape.rotation = attack_direction.angle()

func process_input(_event: InputEvent) -> State:
	if Input.is_action_just_pressed("ui_attack"):
		attack_buffer = true
	return null

func process_physics(_delta: float) -> State:
	
	if not parent.animations.is_playing():
		if attack_buffer and next_attack:
			return next_attack
		return idle_state
	
	parent.move_and_slide()
	
	return null

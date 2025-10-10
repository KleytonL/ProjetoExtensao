extends CharacterBody2D

enum States {IDLE, RUN, PUNCH}

const SPEED = 50.0
const DECELERATION = 200.0

var state: States = States.IDLE : set = set_state
@onready var _sprite = $AnimatedSprite2D
@onready var _animation = $AnimationTree.get("parameters/playback")

func _physics_process(delta: float) -> void:
	
	var direction_x := Input.get_axis("ui_left", "ui_right")
	var direction_y := Input.get_axis("ui_up", "ui_down")

	if state in [States.IDLE, States.RUN]:
		if direction_x:
			velocity.x = direction_x * SPEED
			_sprite.scale.x = -1 if velocity.x < 0 else 1
		else:
			velocity.x = move_toward(velocity.x, 0, DECELERATION * delta)

		if direction_y:
			velocity.y = direction_y * SPEED
		else:
			velocity.y = move_toward(velocity.y, 0, DECELERATION * delta)

		if velocity.x != 0 || velocity.y != 0:
			set_state(States.RUN)
		else:
			set_state(States.IDLE)

	if Input.is_action_just_pressed("punch"):
		set_state(States.PUNCH)

	move_and_slide()

func set_state(new_state: States) -> void:
	var previous_state := state
	state = new_state

	if state == States.IDLE:
		_animation.travel("idle")
	elif state == States.RUN:
		_animation.travel("run")
	elif state == States.PUNCH:
		_animation.travel("punch")
		state = previous_state

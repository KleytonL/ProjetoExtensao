extends CharacterBody2D


const SPEED = 75.0
const DECELERATION = 300.0

@onready var _animation = $AnimatedSprite2D

func _physics_process(delta: float) -> void:

	if velocity.x || velocity.y != 0:
		_animation.play("run")
	else:
		_animation.play("idle")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction_x := Input.get_axis("ui_left", "ui_right")
	var direction_y := Input.get_axis("ui_up", "ui_down")

	if direction_x:
		velocity.x = direction_x * SPEED
		_animation.flip_h = true if velocity.x < 0 else false 
	else:
		velocity.x = move_toward(velocity.x, 0, DECELERATION * delta)

	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, DECELERATION * delta)

	move_and_slide()

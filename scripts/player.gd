extends CharacterBody2D


const SPEED = 50.0
const DECELERATION = 200.0

var can_attack: bool = true
@onready var _animation = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	
	var direction_x := Input.get_axis("ui_left", "ui_right")
	var direction_y := Input.get_axis("ui_up", "ui_down")

	if Input.is_action_just_pressed("punch"):
		_animation.play("punch")
	
	if velocity.x != 0 || velocity.y != 0:
		_animation.play("run")
	else:
		_animation.play("idle")

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

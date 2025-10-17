extends CharacterBody2D

enum States {IDLE, RUN, PUNCH, HURT, DEAD}

const SPEED = 50.0
const DECELERATION = 200.0
const DAMAGE = 5

var state: States = States.IDLE : set = set_state

var health: int = 100
var knockback: Vector2 = Vector2.ZERO
@onready var _sprite = $AnimatedSprite2D
@onready var _animation = $AnimationTree
@onready var enemy = get_tree().get_first_node_in_group("Enemy")

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
	var state_machine = _animation.get("parameters/playback")
	var previous_state := state
	state = new_state

	if state == States.IDLE:
		state_machine.travel("idle")
	elif state == States.RUN:
		state_machine.travel("run")
	elif state == States.PUNCH:
		state_machine.travel("punch")
		velocity = Vector2.ZERO
		await _animation.animation_finished
		state = previous_state
	elif state == States.HURT:
		state_machine.travel("punch")
		velocity = knockback
		await _animation.animation_finished
		state = previous_state

func take_damage(damage: int) -> void:
	set_state(States.HURT)
	health = health - damage
	if health <= 0:
		queue_free()

func apply_knockback(direction: Vector2, force: float) -> void:
	knockback = direction * force

func _on_combat_collisions_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy_hurtbox"):
		enemy.take_damage(DAMAGE)

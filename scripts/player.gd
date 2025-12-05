extends CharacterBody2D

enum States {IDLE, RUN, ATK01, ATK02, ATK03, HURT, DEAD}

const SPEED = 50.0
const DECELERATION = 200.0
const DAMAGE = 2

var atkPoints = 3;
var state: States = States.IDLE : set = set_state

var health: int = 100
var knockback: Vector2 = Vector2.ZERO
@onready var _sprite = $Sprite2D
@onready var _animation = $AnimationTree
@onready var _timer = $AttackResetTimer

func _physics_process(delta: float) -> void:
	var direction_x := Input.get_axis("ui_left", "ui_right")
	var direction_y := Input.get_axis("ui_up", "ui_down")
	
	if state in [States.IDLE, States.RUN]:
		if direction_x:
			velocity.x = direction_x * SPEED
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

		if Input.is_action_just_pressed("attackBtn") && atkPoints == 3:
			atkPoints -= 1
			set_state(States.ATK01)
		elif Input.is_action_just_pressed("attackBtn") && atkPoints == 2:
			atkPoints -= 1
			set_state(States.ATK02)
		elif Input.is_action_just_pressed("attackBtn") && atkPoints == 1:
			atkPoints -= 1
			set_state(States.ATK03)
		
		if state in [States.ATK01, States.ATK02, States.ATK03]:
			velocity = Vector2.ZERO

	move_and_slide()

func set_state(new_state: States) -> void:
	var state_machine = _animation.get("parameters/playback")
	var previous_state := state
	state = new_state

	if state == States.IDLE:
		state_machine.travel("idle_anim")
	elif state == States.RUN:
		state_machine.travel("run_anim")
		_sprite.scale.x = -1 if velocity.x < 0 else 1
	elif state == States.ATK01:
		state_machine.travel("atk_anim_01")
		await _animation.animation_finished
		state = previous_state
		_timer.start()
	elif state == States.ATK02:
		state_machine.travel("atk_anim_02")
		await _animation.animation_finished
		state = States.IDLE
		_timer.start()
	elif state == States.ATK03:
		state_machine.travel("atk_anim_03")
		await _animation.animation_finished
		state = States.IDLE
		atkPoints = 3
	elif state == States.HURT:
		state_machine.travel("hurt_anim")
		velocity = knockback
		_sprite.scale.x = -1 if velocity.x > 0 else 1
		await _animation.animation_finished
		velocity = Vector2.ZERO
		state = States.IDLE

func take_damage(damage: int) -> void:
	set_state(States.HURT)
	health = health - damage
	if health <= 0:
		queue_free()
		get_tree().change_scene_to_file("res://scenes/deathscreen.tscn")

func apply_knockback(direction: Vector2, force: float) -> void:
	knockback = direction * force


func _on_hit_box_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy_hurtbox"):
		area.get_parent().get_parent().take_damage(DAMAGE)


func _on_attack_reset_timer_timeout() -> void:
	set_state(States.IDLE)
	atkPoints = 3;

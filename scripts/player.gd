extends CharacterBody2D

enum States {IDLE, RUN, DASH, ATK01, ATK02, ATK03, HURT}

const SPEED = 50.0
const DECELERATION = 200.0
const DAMAGE = 2

var atkPoints = 3;
var canDash: bool = true
var state: States = States.IDLE : set = set_state
var knockback: Vector2 = Vector2.ZERO

var health: int = 100
var level = 1
var experience = 0
var collected_exp = 0
var time = 0

@onready var _sprite = $Sprite2D
@onready var _animation = $AnimationTree
@onready var _hurtbox = $HurtBox/CollisionShape2D
@onready var _atk_timer = $AttackResetTimer
@onready var _dash_timer = $DashTimer
@onready var _iframes_timer = $iFramesTimer
@onready var _sfx = $AudioStreamPlayer

@onready var _exp_bar = get_node("%ExpBar")
@onready var _level_label = get_node("%LevelLabel")
@onready var _timer_label = get_node("%TimerLabel")

func _ready():
	set_expbar(experience, exp_capacity())

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

		if Input.is_action_just_pressed("dashBtn") && canDash:
			if state == States.IDLE:
				velocity = Vector2(SPEED*3, 0) if _sprite.scale.x == 1 else Vector2(-SPEED*3, 0)
			elif state == States.RUN:
				velocity = Vector2(direction_x * (SPEED * 3), direction_y * (SPEED * 3))
			set_state(States.DASH)

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
			velocity = Vector2(SPEED/2, 0) if _sprite.scale.x == 1 else Vector2(-SPEED/2, 0)

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
	
	elif state == States.DASH:
		state_machine.travel("dash_anim")
		_hurtbox.call_deferred("set", "disabled", true)
		canDash = false
		await _animation.animation_finished
		_dash_timer.start()
		_iframes_timer.start()
		velocity = Vector2.ZERO
		state = previous_state
	
	elif state == States.ATK01:
		state_machine.travel("atk_anim_01")
		await _animation.animation_finished
		_atk_timer.start()
		state = previous_state
	
	elif state == States.ATK02:
		state_machine.travel("atk_anim_02")
		await _animation.animation_finished
		_atk_timer.start()
		state = States.IDLE
	
	elif state == States.ATK03:
		state_machine.travel("atk_anim_03")
		await _animation.animation_finished
		state = States.IDLE
		atkPoints = 3
	
	elif state == States.HURT:
		state_machine.travel("hurt_anim")
		_hurtbox.call_deferred("set", "disabled", true)
		velocity = knockback
		_sprite.scale.x = -1 if velocity.x > 0 else 1
		await _animation.animation_finished
		_iframes_timer.start()
		velocity = Vector2.ZERO
		state = States.IDLE

func take_damage(damage: int) -> void:
	set_state(States.HURT)
	health = health - damage
	_sfx.play()
	if health <= 0:
		on_death()

func apply_knockback(direction: Vector2, force: float) -> void:
	knockback = direction * force

func on_death():
	call_deferred("queue_free")

func _on_hit_box_area_entered(area: Area2D) -> void:
	#a coisa mais depressiva desse código
	var knockback_direction = (area.get_parent().global_position - global_position).normalized()
	if area.is_in_group("enemy_hurtbox"):
		_sfx.play()
		area.get_parent().apply_knockback(knockback_direction, 20.0)
		area.get_parent().call_deferred("take_damage", DAMAGE)

func _on_dash_timer_timeout() -> void:
	canDash = true

func _on_attack_reset_timer_timeout() -> void:
	set_state(States.IDLE)
	atkPoints = 3;

func _on_i_frames_timer_timeout() -> void:
	_hurtbox.call_deferred("set", "disabled", false)

func _on_pull_range_area_entered(area: Area2D) -> void:
	if area.is_in_group("collectables"):
		area.target = self

func _on_collect_range_area_entered(area: Area2D) -> void:
	if area.is_in_group("collectables"):
		var exp_value = area.collect()
		calculate_exp(exp_value)

func calculate_exp(exp_value):
	var exp_required = exp_capacity()
	collected_exp += exp_value
	if experience + collected_exp >= exp_required:
		collected_exp -= exp_required - experience
		level += 1
		_level_label.text = str("Level: ", level)
		experience = 0
		calculate_exp(0)
	else:
		experience += collected_exp
		collected_exp = 0
	
	set_expbar(experience, exp_required)

func exp_capacity():
	var exp_cap = level
	if level < 20:
		exp_cap = level * 5
	elif level < 40:
		exp_cap = 95 * (level - 19) * 8
	else:
		exp_cap = 255 + (level - 39) * 12
	return exp_cap

func set_expbar(set_value = 1, set_max_value = 100):
	_exp_bar.value = set_value
	_exp_bar.max_value = set_max_value

func change_time(argtime = 0):
	time = argtime
	var get_minutes = int(time/60.0)
	var get_seconds = time % 60
	if get_minutes < 10:
		get_minutes = str(0, get_minutes)
	if get_seconds < 10:
		get_seconds = str(0, get_seconds)
	_timer_label.text = str(get_minutes, ":", get_seconds)

extends CharacterBody2D
class_name Player

@onready var animations: AnimationPlayer = $AnimationPlayer
@onready var state_machine: StateMachine = $StateMachine
@onready var sprite: Sprite2D = $Sprite2D

var level = 1
var experience = 0
var collected_exp = 0
var time = 0

var soulfire = preload("res://scenes/character/weapon_soulfire.tscn")
@onready var _item_options = preload("res://scenes/misc/item_option.tscn")

var soulfire_atkspeed = 3
var soulfire_amount = 1
var soulfire_level = 0

var enemy_in_range: Array = []
var upgrades_collected = []
var upgrade_options = []
var defense = 0
var speed = 0
var attack_cooldown = 0
var attack_size = 0
var additional_attacks = 0

@onready var _exp_bar: ProgressBar = get_node("%ExpBar")
@onready var _level_label: Label = get_node("%lbl_level")
@onready var _timer_label: Label = get_node("%lbl_timer")
@onready var _level_panel: Panel = get_node("%LevelPanel")
@onready var _upgrade_grid: VBoxContainer = get_node("%UpgradeGrid")

func _ready():
	state_machine.init(self)
	set_expbar(experience, exp_capacity())

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
#	var direction_y := Input.get_axis("ui_up", "ui_down")
#	
#	if state in [States.IDLE, States.RUN]:
#		if direction_x:
#			velocity.x = direction_x * SPEED
#		else:
#			velocity.x = move_toward(velocity.x, 0, DECELERATION * delta)
#
#		if direction_y:
#			velocity.y = direction_y * SPEED
#		else:
#			velocity.y = move_toward(velocity.y, 0, DECELERATION * delta)
#
#		if velocity.x != 0 || velocity.y != 0:
#			set_state(States.RUN)
#		else:
#			set_state(States.IDLE)
#
#		if Input.is_action_just_pressed("ui_dash"):
#			if state == States.IDLE || (direction_x == 0 && direction_y == 0):
#				velocity = Vector2(SPEED * 3, 0) if _sprite.scale.x == 1 else Vector2(-SPEED * 3, 0)
#			elif state == States.RUN:
#				velocity = Vector2(direction_x * (SPEED * 3), direction_y * (SPEED * 3))
#			set_state(States.DASH)
#
#		if Input.is_action_just_pressed("ui_attack") && atkPoints == 3:
#			atkPoints -= 1
#			set_state(States.ATK01)
#		elif Input.is_action_just_pressed("ui_attack") && atkPoints == 2:
#			atkPoints -= 1
#			set_state(States.ATK02)
#		elif Input.is_action_just_pressed("ui_attack") && atkPoints == 1:
#			atkPoints -= 1
#			set_state(States.ATK03)
#
#		if state in [States.ATK01, States.ATK02, States.ATK03]:
#			
#			_leap_timer.start()
#			await _leap_timer.timeout
#			
#			velocity = Vector2(SPEED*1.25, 0) if _sprite.scale.x == 1 else Vector2(-SPEED*1.25, 0)
#			
#			_leap_timer.start()
#			await _leap_timer.timeout
#			
#			velocity = Vector2.ZERO

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

#func attack():
#	if soulfire_level > 0:
#		_soulfire_timer.wait_time = soulfire_atkspeed
#		if _soulfire_timer.is_stopped():
#			_soulfire_timer.start()

#func _on_soulfire_timer_timeout() -> void:
#	var soulfire_count = soulfire_amount + additional_attacks
#	while soulfire_count > 0:
#		var soulfire_instance = soulfire.instantiate()
#		soulfire_instance.position = position
#		soulfire_instance.target = get_random_target()
#		soulfire_instance.level = soulfire_level
#		add_child(soulfire_instance)
#		soulfire_count -= 1

func _on_pull_range_area_entered(area: Area2D) -> void:
	if area.is_in_group("collectables"):
		area.target = self

func _on_collect_range_area_entered(area: Area2D) -> void:
	if area.is_in_group("collectables"):
		var exp_value = area.collect()
		calculate_exp(exp_value)

func get_random_target():
	if enemy_in_range.size() > 0:
		return enemy_in_range.pick_random().global_position
	else:
		return Vector2.ZERO

func _on_enemy_range_body_entered(body: Node2D) -> void:
	if not enemy_in_range.has(body):
		enemy_in_range.append(body)

func _on_enemy_range_body_exited(body: Node2D) -> void:
	if enemy_in_range.has(body):
		enemy_in_range.erase(body)

func calculate_exp(exp_value):
	var exp_required = exp_capacity()
	collected_exp += exp_value
	if experience + collected_exp >= exp_required:
		collected_exp -= exp_required - experience
		level += 1
		experience = 0
		level_up()
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

func level_up():
	_level_label.text = str("Level: ", level)
	_level_panel.visible = true
	var options = 0
	var max_options = 3
	while options < max_options:
		var option_choice = _item_options.instantiate()
		option_choice.item = get_random_item()
		_upgrade_grid.add_child(option_choice)
		options+=1
	get_tree().paused = true

func upgrade_character(upgrade):
	match upgrade:
		"soulfire1":
			soulfire_level += 1
		"soulfire2":
			soulfire_level += 1
			soulfire_amount += 1
		"soulfire3":
			soulfire_level += 1
		"soulfire4":
			soulfire_level += 1
			soulfire_amount += 1
		"soulfire5":
			soulfire_level += 1
			soulfire_atkspeed -= 1
		"soulfire6":
			soulfire_level += 1
			soulfire_amount += 2
#		"food":
#			health += 5
#			health = clamp(health, 0, max_health)
#	attack()
#	set_healthbar(health, max_health)

	var option_children = _upgrade_grid.get_children()
	for i in option_children:
		i.queue_free()
	upgrade_options.clear()
	upgrades_collected.append(upgrade)
	_level_panel.visible = false
	get_tree().paused = false
	calculate_exp(0)

func get_random_item():
	var datalist = []
	for i in UpgradeDatabase.UPGRADES:
		if i in upgrades_collected:
			pass
		elif i in upgrade_options:
			pass
		elif UpgradeDatabase.UPGRADES[i]["type"] == "item":
			pass
		elif UpgradeDatabase.UPGRADES[i]["prerequisite"].size() > 0:
			var to_add = true
			for n in UpgradeDatabase.UPGRADES[i]["prerequisite"]:
				if not n in upgrades_collected:
					to_add = false
			if to_add:
				datalist.append(i)
		else: 
			datalist.append(i)
	if datalist.size() > 0:
		var random_item = datalist.pick_random()
		upgrade_options.append(random_item)
		return random_item
	else:
		return null

func change_time(argtime = 0):
	time = argtime
	var get_minutes = int(time/60.0)
	var get_seconds = time % 60
	if get_minutes < 10:
		get_minutes = str(0, get_minutes)
	if get_seconds < 10:
		get_seconds = str(0, get_seconds)
	_timer_label.text = str(get_minutes, ":", get_seconds)

extends CharacterBody2D
class_name Player

@onready var animations: AnimationPlayer = $AnimationPlayer
@onready var state_machine: StateMachine = $StateMachine
@onready var attack_range: AttackRangeComponent = $AttackRangeComponent
@onready var sprite: Sprite2D = $Sprite2D

var level = 1
var experience = 0
var collected_exp = 0
var time = 0

#escudo orbital
var shield_level = 0
var shield_orb_count = 1
var shield_damage = 3

var defense = 0
var speed = 0
var attack_cooldown = 0
var attack_size = 0
var additional_attacks = 0

@onready var _exp_bar: ProgressBar = get_node("%ExpBar")
@onready var _timer_label: Label = get_node("%lbl_timer")

func _ready():
	state_machine.init(self)
	set_expbar(experience, exp_capacity())

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

#func attack():
#	if soulfire_level > 0:
#		_soulfire_timer.wait_time = soulfire_atkspeed
#		if _soulfire_timer.is_stopped():
#			_soulfire_timer.start()

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
		experience = 0
		$GUI/Control/UpgradePanel.level_up()
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

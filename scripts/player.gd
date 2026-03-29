extends CharacterBody2D
class_name Player

@onready var animations: AnimationPlayer = $AnimationPlayer
@onready var state_machine: StateMachine = $StateMachine
@onready var attack_range: AttackRangeComponent = $AttackRangeComponent
@onready var sprite: Sprite2D = $Sprite2D

var defense = 0
var speed = 0
var attack_cooldown = 0
var attack_size = 0
var additional_attacks = 0

func _ready():
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func _on_pull_range_area_entered(area: Area2D) -> void:
	if area.is_in_group("collectables"):
		area.target = self

func _on_collect_range_area_entered(area: Area2D) -> void:
	if area.is_in_group("collectables"):
		var exp_value = area.collect()
		$ExperienceComponent.calculate_exp(exp_value)

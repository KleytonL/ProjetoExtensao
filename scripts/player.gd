extends CharacterBody2D
class_name Player

@export var animations: AnimationPlayer
@export var state_machine: StateMachine
@export var attack_range: AttackRangeComponent
@export var experience: ExperienceComponent
@export var stats: StatsComponent
@export var health: HealthComponent
@export var sprite: Sprite2D

func _ready():
	if UserConfig.is_mobile:
		$GUI/Control/MobileControls.visible = true
	GameLogic.run_reset()
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

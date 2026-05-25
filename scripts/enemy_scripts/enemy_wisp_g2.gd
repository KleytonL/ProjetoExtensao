extends Area2D
class_name EnemyWispG2

@onready var state_machine: StateMachine = $StateMachine
@onready var animations: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D
@export var experience: int = 3
@export var score_given: int = 25

func _ready() -> void:
	state_machine.init(self)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func _on_visibility_notifier_screen_entered() -> void:
	sprite.visible = true

func _on_visibility_notifier_screen_exited() -> void:
	sprite.visible = false

func _on_lifetime_timer_timeout() -> void:
	call_deferred("queue_free")

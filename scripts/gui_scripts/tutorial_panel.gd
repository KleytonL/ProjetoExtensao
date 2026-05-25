extends Control
class_name TutorialPanel

@onready var _animation: AnimationPlayer = $AnimationPlayer
var is_active: bool = false

signal panel_closed

func _ready() -> void:
	if SaveManager.first_time_player:
		self.visible = true
		_animation.play("default_animation")
		await _animation.animation_finished
		is_active = true

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") and is_active:
		_animation.play_backwards("default_animation")
		await _animation.animation_finished
		is_active = false
		self.visible = false
		$TouchScreenButton.process_mode = Node.PROCESS_MODE_DISABLED
		emit_signal("panel_closed")

func show_tutorial() -> void:
	self.visible = true
	_animation.play("default_animation")
	await _animation.animation_finished
	$TouchScreenButton.process_mode = Node.PROCESS_MODE_INHERIT
	is_active = true

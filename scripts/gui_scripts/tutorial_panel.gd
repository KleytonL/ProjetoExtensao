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
		self.visible = false
		emit_signal("panel_closed")

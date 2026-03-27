extends Control

@onready var _resume_btn : TextureButton = $PanelContainer/VBoxContainer/resume_btn
@onready var _hover: AudioStreamPlayer = $HoverSFX
@onready var _click: AudioStreamPlayer = $ClickSFX

func _ready():
	hide()

func resume():
	hide()
	get_tree().paused = false

func pause():
	show()
	_resume_btn.grab_focus()
	get_tree().paused = true

func pauseGame():
	if Input.is_action_just_pressed("ui_pause") and GameLogic.can_pause:
		if get_tree().paused:
			resume()
		else:
			pause()

func _on_resume_btn_focus_entered() -> void:
	_hover.play()

func _on_resume_btn_pressed() -> void:
	resume()

func _on_restart_btn_focus_entered() -> void:
	_hover.play()

func _on_restart_btn_pressed() -> void:
	_click.play()
	await _click.finished
	resume()
	get_tree().reload_current_scene()

func _on_exit_btn_focus_entered() -> void:
	_hover.play()

func _on_exit_btn_pressed() -> void:
	resume()
	_click.play()
	await _click.finished
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")

func _process(_delta: float) -> void:
	pauseGame()

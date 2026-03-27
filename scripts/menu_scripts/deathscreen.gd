extends Control

@onready var _restart_btn: TextureButton = $PanelContainer/VBoxContainer/restart_btn
@onready var _hover: AudioStreamPlayer = $HoverSFX
@onready var _click: AudioStreamPlayer = $ClickSFX

func _ready():
	hide()

func pause():
	show()
	_restart_btn.grab_focus()
	get_tree().paused = true
	GameLogic.can_pause = false

func resume():
	hide()
	get_tree().paused = false
	GameLogic.can_pause = true


func _on_restart_btn_focus_entered() -> void:
	_hover.play()

func _on_restart_btn_pressed() -> void:
	_click.play()
	await _click.finished
	resume()
	get_tree().change_scene_to_file("res://scenes/world/world.tscn")

func _on_exit_btn_focus_entered() -> void:
	_hover.play()

func _on_exit_btn_pressed() -> void:
	resume()
	_click.play()
	await _click.finished
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")

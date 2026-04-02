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
	resume()
	LoadingScreen.reload()

func _on_exit_btn_focus_entered() -> void:
	_hover.play()

func _on_exit_btn_pressed() -> void:
	_click.play()
	LoadingScreen.change_scene("res://scenes/menus/main_menu.tscn")
	resume()

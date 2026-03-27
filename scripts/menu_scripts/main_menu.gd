extends Control

@onready var _start_btn: TextureButton = $VBoxContainer/play_btn
@onready var _hover: AudioStreamPlayer = $HoverSFX
@onready var _click: AudioStreamPlayer = $ClickSFX

func _ready() -> void:
	if !MenuMusic.playing:
		MenuMusic.play()
	_start_btn.grab_focus()

func _on_play_btn_focus_entered() -> void:
	_hover.play()

func _on_play_btn_pressed() -> void:
	MenuMusic.stop()
	_click.play()
	await _click.finished
	get_tree().change_scene_to_file("res://scenes/world/level_01.tscn")


func _on_config_btn_focus_entered() -> void:
	_hover.play()

func _on_config_btn_pressed() -> void:
	_click.play()
	await _click.finished
	get_tree().change_scene_to_file("res://scenes/menus/settings_menu.tscn")


func _on_cred_btn_focus_entered() -> void:
		_hover.play()

func _on_cred_btn_pressed() -> void:
	_click.play()
	await _click.finished
	get_tree().change_scene_to_file("res://scenes/menus/credits_menu.tscn")
	

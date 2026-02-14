extends Control

@onready var _start_btn: TextureButton = $VBoxContainer/play_btn

func _ready() -> void:
	_start_btn.grab_focus()

func _on_play_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/world/world.tscn")

func _on_config_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/settings_menu.tscn")


func _on_cred_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/credits_menu.tscn")

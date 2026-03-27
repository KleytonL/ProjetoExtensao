extends Control

@onready var _voltar_btn: TextureButton = $voltar_btn
@onready var _hover: AudioStreamPlayer = $HoverSFX
@onready var _click: AudioStreamPlayer = $ClickSFX

func _ready() -> void:
	_voltar_btn.grab_focus()

func _on_voltar_btn_focus_entered() -> void:
	_hover.play()

func _on_voltar_btn_pressed() -> void:
	_click.play()
	await _click.finished
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")

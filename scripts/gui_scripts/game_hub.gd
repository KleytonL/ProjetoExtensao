extends Control
class_name GameHub

@onready var _hover: AudioStreamPlayer = $HoverSFX
@onready var _click: AudioStreamPlayer = $ClickSFX

func _ready() -> void:
	$level_btn.grab_focus()

func _on_level_btn_focus_entered() -> void:
	_hover.play()
	$LevelSelectionPanel.on_focus()

func _on_shop_btn_focus_entered() -> void:
	_hover.play()

func _on_voltar_btn_focus_entered() -> void:
	_hover.play()

func _on_voltar_btn_pressed() -> void:
	_click.play()
	LoadingScreen.change_scene("res://scenes/menus/main_menu.tscn")

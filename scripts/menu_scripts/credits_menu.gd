extends Control

@onready var _voltar_btn: TextureButton = $voltar_btn
@onready var _hover: AudioStreamPlayer = $HoverSFX
@onready var _click: AudioStreamPlayer = $ClickSFX

func _ready() -> void:
	if UserConfig.is_mobile:
		$voltar_btn.mouse_filter = MOUSE_FILTER_STOP
		return
	_voltar_btn.grab_focus()

func _on_voltar_btn_focus_entered() -> void:
	_hover.play()

func _on_voltar_btn_pressed() -> void:
	_click.play()
	LoadingScreen.change_scene("res://scenes/menus/main_menu.tscn")

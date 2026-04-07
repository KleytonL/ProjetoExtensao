extends Control

@onready var _voltar_btn: TextureButton = $VBoxContainer/voltar_btn
@onready var sfx_toggle: CheckButton = $VBoxContainer/sfx_toggle
@onready var bgm_toggle: CheckButton = $VBoxContainer/bgm_toggle
@onready var sfx_slider: HSlider = $VBoxContainer/sfx_slider
@onready var bgm_slider: HSlider = $VBoxContainer/bgm_slider
@onready var _hover: AudioStreamPlayer = $HoverSFX
@onready var _click: AudioStreamPlayer = $ClickSFX

func _ready() -> void:
	sfx_toggle.button_pressed = UserConfig.sfx_enabled
	bgm_toggle.button_pressed = UserConfig.bgm_enabled
	sfx_slider.value = UserConfig.sfx_volume
	bgm_slider.value = UserConfig.bgm_volume
	_voltar_btn.grab_focus()

func _on_sfx_toggle_focus_entered() -> void:
	_hover.play()

func _on_sfx_toggle_toggled(toggled_on: bool) -> void:
	_click.play()
	UserConfig.sfx_enabled = toggled_on
	UserConfig.apply_audio()

func _on_bgm_toggle_focus_entered() -> void:
	_hover.play()

func _on_bgm_toggle_toggled(toggled_on: bool) -> void:
	_click.play()
	UserConfig.bgm_enabled = toggled_on
	UserConfig.apply_audio()

func _on_sfx_slider_focus_entered() -> void:
	_hover.play()

func _on_sfx_slider_value_changed(value: float) -> void:
	_click.play()
	UserConfig.sfx_volume = value
	UserConfig.apply_audio()

func _on_bgm_slider_focus_entered() -> void:
	_hover.play()

func _on_bgm_slider_value_changed(value: float) -> void:
	_click.play()
	UserConfig.bgm_volume = value
	UserConfig.apply_audio()

func _on_voltar_btn_focus_entered() -> void:
	_hover.play()

func _on_voltar_btn_pressed() -> void:
	_click.play()
	UserConfig.save_config()
	LoadingScreen.change_scene("res://scenes/menus/main_menu.tscn")

extends Control

@onready var _start_btn: TextureButton = $VBoxContainer/play_btn
@onready var _exit_btn: TextureButton = $VBoxContainer/exit_btn
@onready var _hover: AudioStreamPlayer = $HoverSFX
@onready var _click: AudioStreamPlayer = $ClickSFX

func _ready() -> void:
	Engine.time_scale = 1.0
	
	if !MenuMusic.playing:
		MenuMusic.play()
	
	_exit_btn.visible = UserConfig.is_pwa
	
	if SaveManager.first_time_player:
		await $TutorialPanel.panel_closed
		SaveManager.first_time_player = false
		SaveManager.save()
	
	if UserConfig.is_mobile:
		for b in $VBoxContainer.get_children():
			b.mouse_filter = MOUSE_FILTER_STOP
		return
	
	_start_btn.grab_focus()

func _on_play_btn_focus_entered() -> void:
	_hover.play()

func _on_play_btn_pressed() -> void:
	_click.play()
	LoadingScreen.change_scene("res://scenes/menus/game_hub.tscn")

func _on_config_btn_focus_entered() -> void:
	_hover.play()

func _on_config_btn_pressed() -> void:
	_click.play()
	LoadingScreen.change_scene("res://scenes/menus/settings_menu.tscn")

func _on_cred_btn_focus_entered() -> void:
	_hover.play()

func _on_cred_btn_pressed() -> void:
	_click.play()
	LoadingScreen.change_scene("res://scenes/menus/credits_menu.tscn")

func _on_exit_btn_focus_entered() -> void:
	_hover.play()

func _on_exit_btn_pressed() -> void:
	_click.play()
	LoadingScreen.exit_game()

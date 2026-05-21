extends Control

@onready var _player: Player = get_tree().get_first_node_in_group("Player")
@onready var _btn_container : VBoxContainer = $PanelContainer/VBoxContainer
@onready var _restart_btn: TextureButton = $PanelContainer/VBoxContainer/restart_btn
@onready var _hover: AudioStreamPlayer = $HoverSFX
@onready var _click: AudioStreamPlayer = $ClickSFX

func _ready():
	if UserConfig.is_mobile:
		for b in _btn_container.get_children():
			b.mouse_filter = MOUSE_FILTER_STOP
	hide()
	GameLogic.is_dead = false

func calculate_essences() -> int:
	var level_essences = GameLogic.holding_essences
	@warning_ignore("narrowing_conversion")
	var converted_exp: int = _player.experience.total_experience * 0.01
	@warning_ignore("narrowing_conversion")
	var converted_kill: int = GameLogic.enemies_defeated * 0.05
	@warning_ignore("integer_division")
	var essences = level_essences + (converted_exp * converted_kill) / 2
	$InfoLabel.text = str(
		"Você Perdeu!
		- Essências -
		50% Adquiridas: ", GameLogic.holding_essences,"
		0.5% XP: ", converted_exp," * 2.5% Kill Bonus: ", converted_kill,"
		Total: ", essences
		)
	return essences

func pause():
	show()
	get_tree().paused = true
	GameLogic.can_pause = false
	GameLogic.is_dead = true
	_restart_btn.grab_focus()
	SaveManager.essences_collected += calculate_essences()
	SaveManager.save()

func resume():
	hide()
	get_tree().paused = false
	GameLogic.can_pause = true

func _on_restart_btn_focus_entered() -> void:
	_hover.play()

func _on_restart_btn_pressed() -> void:
	_click.play()
	LoadingScreen.reload()

func _on_exit_btn_focus_entered() -> void:
	_hover.play()

func _on_exit_btn_pressed() -> void:
	_click.play()
	LoadingScreen.change_scene("res://scenes/menus/game_hub.tscn")

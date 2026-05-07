extends Control
class_name VictoryScreen

@onready var _player: Player = get_tree().get_first_node_in_group("Player")
@onready var _restart_btn: TextureButton = $PanelContainer/VBoxContainer/restart_btn
@onready var _hover: AudioStreamPlayer = $HoverSFX
@onready var _click: AudioStreamPlayer = $ClickSFX

func _ready():
	hide()

func calculate_essences(world_level: int) -> int:
	var level_essences: int = GameLogic.holding_essences + (100 * world_level)
	@warning_ignore("narrowing_conversion")
	var converted_exp: int = _player.experience.total_experience * 0.01
	@warning_ignore("narrowing_conversion")
	var converted_kill: int = GameLogic.enemies_defeated * 0.05
	var essences = level_essences + (converted_exp * converted_kill)
	$InfoLabel.text = str(
		"Fase Concluída!
		 - Essências -
		Bonus de fase: ", level_essences, "
		Adquiridas: ", GameLogic.holding_essences,"
		1% XP: ", converted_exp ," * 5% Kill Bonus: ", converted_kill,"
		Total: ", essences
		)
	return essences

func pause(level: int = 1):
	show()
	get_tree().paused = true
	GameLogic.can_pause = false
	_restart_btn.grab_focus()
	SaveManager.essences_collected += calculate_essences(level)
	SaveManager.save()

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
	resume()
	LoadingScreen.change_scene("res://scenes/menus/game_hub.tscn")

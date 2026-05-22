extends Control
class_name VictoryScreen

@onready var _player: Player = get_tree().get_first_node_in_group("Player")
@onready var _restart_btn: TextureButton = $CenterContainer/TextureRect/HBoxContainer/restart_btn
@onready var _btn_container : HBoxContainer = $CenterContainer/TextureRect/HBoxContainer
@onready var _hover: AudioStreamPlayer = $HoverSFX
@onready var _click: AudioStreamPlayer = $ClickSFX

func _ready():
	hide()

func calculate_essences(world_level: int) -> int:
	var level_base: int = 150 * world_level
	var level_essences: int = GameLogic.holding_essences
	@warning_ignore("narrowing_conversion")
	var converted_exp: int = _player.experience.total_experience * 0.5
	@warning_ignore("narrowing_conversion")
	var converted_kill: int = GameLogic.enemies_defeated * 1.5
	var essences = level_essences + converted_exp + converted_kill
	$CenterContainer/TextureRect/InfoText.text = str(
		"[center][b]Você Venceu![/b][/center]\n",
		"[center]- Essências -[/center]\n",
		"\nBonus de vitória: ", level_base, "\n",
		"Adquiridas: ", level_essences, "\n",
		"Bônus XP (x0.5): ", converted_exp, "\n",
		"Bônus Kills (x1.5): ", converted_kill, "\n",
		"[center][b]Total: ", essences, "\n",
		"\nPontuação: ", GameLogic.current_score, "[/b][/center]"
		)
	return essences

func pause(level: int = 1):
	show()
	$AnimationPlayer.play("victory_animation")
	get_tree().paused = true
	GameLogic.can_pause = false
	if UserConfig.is_mobile:
		for b in _btn_container.get_children():
			b.mouse_filter = MOUSE_FILTER_STOP
	else:
		_restart_btn.grab_focus()
	SaveManager.essences_collected += calculate_essences(level)
	SaveManager.save()

func resume():
	hide()
	Engine.time_scale = 1.0
	get_tree().paused = false
	GameLogic.can_pause = true

func _on_restart_btn_focus_entered() -> void:
	_hover.play()

func _on_restart_btn_pressed() -> void:
	resume()
	_click.play()
	LoadingScreen.reload()

func _on_exit_btn_focus_entered() -> void:
	_hover.play()

func _on_exit_btn_pressed() -> void:
	resume()
	_click.play()
	LoadingScreen.change_scene("res://scenes/menus/game_hub.tscn")

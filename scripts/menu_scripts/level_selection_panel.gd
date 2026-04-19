extends Panel
class_name LevelSelectionPanel

var focused: bool = false
@onready var _grid: VBoxContainer = $Grid

func _ready() -> void:
	if 2 not in SaveManager.levels_unlocked:
		$Grid/level_two_button.focus_mode = FOCUS_NONE
		$Grid/level_two_button.modulate = Color(0.5, 0.5, 0.5, 1.0)
	if 3 not in SaveManager.levels_unlocked:
		$Grid/level_three_button.focus_mode = FOCUS_NONE
		$Grid/level_three_button.modulate = Color(0.5, 0.5, 0.5, 1.0)
	

func on_focus() -> void:
	if focused:
		return
	self.visible = true
	$AnimationPlayer.play("show_animation")
	focused = true
	for i in _grid.get_children():
		i.disabled = false

func out_of_focus() -> void:
	if not focused:
		return
	$AnimationPlayer.play_backwards("show_animation")
	focused = false
	for i in _grid.get_children():
		i.disabled = true
	self.visible = false

func _on_level_one_button_pressed() -> void:
	$ClickSFX.play()
	MenuMusic.stop()
	LoadingScreen.change_scene("res://scenes/world/level_01.tscn")

func _on_level_two_button_pressed() -> void:
	$ClickSFX.play()
	if 2 not in SaveManager.levels_unlocked:
		return
	MenuMusic.stop()
	LoadingScreen.change_scene("res://scenes/world/level_02.tscn")

func _on_level_three_button_pressed() -> void:
	$ClickSFX.play()
	if 3 not in SaveManager.levels_unlocked:
		return
	MenuMusic.stop()
	LoadingScreen.change_scene("res://scenes/world/level_03.tscn")

func _on_level_one_button_focus_entered() -> void:
	$HoverSFX.play()

func _on_level_two_button_focus_entered() -> void:
	$HoverSFX.play()

func _on_level_three_button_focus_entered() -> void:
	$HoverSFX.play()

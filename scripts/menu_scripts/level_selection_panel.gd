extends Panel
class_name LevelSelectionPanel

var focused: bool = false
@onready var _grid: VBoxContainer = $Grid

func _ready() -> void:
	on_focus()

func on_focus() -> void:
	if focused:
		return
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

func _on_level_one_button_pressed() -> void:
	MenuMusic.stop()
	LoadingScreen.change_scene("res://scenes/world/level_01.tscn")

func _on_level_two_button_pressed() -> void:
	if 2 not in SaveManager.levels_unlocked:
		return
	MenuMusic.stop()
	LoadingScreen.change_scene("res://scenes/world/level_02.tscn")

func _on_level_three_button_pressed() -> void:
	if 3 not in SaveManager.levels_unlocked:
		return
	MenuMusic.stop()
	LoadingScreen.change_scene("res://scenes/world/level_03.tscn")

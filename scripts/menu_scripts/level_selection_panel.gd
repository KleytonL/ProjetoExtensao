extends Panel
class_name LevelSelectionPanel

func _ready() -> void:
	on_focus()

func on_focus() -> void:
	$AnimationPlayer.play("show_animation")

func out_of_focus() -> void:
	$AnimationPlayer.play_backwards("show_animation")

func _on_level_one_button_pressed() -> void:
	MenuMusic.stop()
	LoadingScreen.change_scene("res://scenes/world/level_01.tscn")

func _on_level_two_button_pressed() -> void:
	MenuMusic.stop()
	LoadingScreen.change_scene("res://scenes/world/level_02.tscn")

func _on_level_three_button_pressed() -> void:
	MenuMusic.stop()
	LoadingScreen.change_scene("res://scenes/world/level_03.tscn")

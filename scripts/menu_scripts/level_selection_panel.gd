extends Panel
class_name LevelSelectionPanel

func on_focus() -> void:
	$AnimationPlayer.play("show_animation")

func out_of_focus() -> void:
	$AnimationPlayer.play_backwards("show_animation")

func _on_level_one_button_pressed() -> void:
	LoadingScreen.change_scene("res://scenes/world/level_01.tscn")

extends Control

func _ready():
	hide()

func resume():
	hide()
	get_tree().paused = false

func pause():
	show()
	get_tree().paused = true

func pauseGame():
	if Input.is_action_just_pressed("pauseBtn"):
		if get_tree().paused:
			resume()
		else:
			pause()

func _on_resume_btn_pressed() -> void:
	resume()

func _on_restart_btn_pressed() -> void:
	resume()
	get_tree().reload_current_scene()

func _on_exit_btn_pressed() -> void:
	resume()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _process(delta: float) -> void:
	pauseGame()

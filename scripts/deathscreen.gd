extends Control


# Called when the node enters the scene tree for the first time.
#func _ready():
#	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func _on_restart_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_exit_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

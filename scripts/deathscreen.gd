extends Control

@onready var player = get_tree().get_first_node_in_group("Player")

func _ready():
	hide()

func pause():
	show()
	get_tree().paused = true

func resume():
	hide()
	get_tree().paused = false

func _process(_delta: float) -> void:
	if !player:
		pause()

func _on_restart_btn_pressed() -> void:
	resume()
	get_tree().change_scene_to_file("res://scenes/world/world.tscn")


func _on_exit_btn_pressed() -> void:
	resume()
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")

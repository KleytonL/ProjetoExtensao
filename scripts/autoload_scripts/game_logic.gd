extends Node

var can_pause = true
var can_dash = true

func apply_dash_timer() -> void:
	can_dash = false
	await get_tree().create_timer(3.25).timeout
	can_dash = true

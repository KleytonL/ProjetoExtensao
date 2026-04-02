extends State
class_name DeathState

@onready var experience = preload("res://scenes/misc/experience.tscn")
@onready var death_vfx = preload("res://scenes/misc/death_vfx.tscn")

func enter() -> void:
	var new_exp: Experience = experience.instantiate()
	var new_vfx = death_vfx.instantiate()
	new_exp.global_position = parent.global_position
	new_exp.value = parent.experience
	new_vfx.global_position = parent.global_position
	parent.get_parent().call_deferred("add_child", new_exp)
	parent.get_parent().call_deferred("add_child", new_vfx)
	parent.queue_free()

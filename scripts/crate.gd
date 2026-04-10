extends EnemyHurtboxComponent
class_name Crate

@onready var _beef = preload("res://scenes/misc/beef.tscn")

func destroy() -> void:
	var new_beef = _beef.instantiate()
	new_beef.position = global_position
	get_parent().call_deferred("add_child", new_beef)
	queue_free()

extends Line2D
class_name Trail

var queue: Array
@export var length: int

func _process(_delta: float) -> void:
	var pos = get_parent().global_position
	
	queue.push_front(pos)
	
	if queue.size() > length:
		queue.pop_back()
	
	clear_points()
	
	for i in queue:
		add_point(i)

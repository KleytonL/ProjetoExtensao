extends Label

var time = 0

func _on_timer_timeout() -> void:
	time += 1
	change_time()

func change_time():
	var get_minutes = int(time/60.0)
	var get_seconds = time % 60
	if get_minutes < 10:
		get_minutes = str(0, get_minutes)
	if get_seconds < 10:
		get_seconds = str(0, get_seconds)
	self.text = str(get_minutes, ":", get_seconds)

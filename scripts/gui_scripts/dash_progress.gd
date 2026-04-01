extends TextureProgressBar
class_name DashProgress

@onready var timer: Timer = $UpdateTimer

func _ready() -> void:
	self.max_value = 3
	self.value = max_value

func update_progress() -> void:
	self.value = 0
	timer.start()

func _on_update_timer_timeout() -> void:
	if self.value >= self.max_value:
		timer.stop()
		return
	self.value += 0.1
	timer.start()

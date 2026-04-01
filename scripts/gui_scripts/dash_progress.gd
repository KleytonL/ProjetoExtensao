extends TextureProgressBar
class_name DashProgress

func _ready() -> void:
	self.max_value = 100
	self.value = max_value

func update_progress() -> void:
	GameLogic.can_dash = false
	self.value = 0

func _process(_delta: float) -> void:
	if self.value >= self.max_value:
		GameLogic.can_dash = true
		return
	self.value += 0.1

extends Label

func _process(_delta: float) -> void:
	self.text = "%06d" % GameLogic.current_score

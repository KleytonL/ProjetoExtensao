extends AnimatedSprite2D

@onready var _sfx = $AudioStreamPlayer

func _ready() -> void:
	_sfx.play()
	await self.animation_finished
	queue_free()

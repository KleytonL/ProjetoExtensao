extends Node
class_name AfterImageComponent

@onready var _timer: Timer = $IntervalTimer
@export var _sprite: Node2D
var _timer_interval: float
var _image_duration: float

func start(_interval: float, _duration) -> void:
	_timer_interval = _interval
	_image_duration = _duration
	_timer.wait_time = _timer_interval
	_timer.start()

func stop() -> void:
	_timer.stop()

func _on_interval_timer_timeout() -> void:
	var image = Sprite2D.new()
	image.flip_h = _sprite.flip_h
	image.global_position = _sprite.global_position
	image.modulate = Color(1.0, 1.0, 1.0, 0.5)
	image.scale = _sprite.scale * 0.75
	image.z_index = _sprite.z_index - 1
	
	if _sprite is Sprite2D:
		image.texture = _sprite.texture
		image.hframes = _sprite.hframes
		image.vframes = _sprite.vframes
		image.frame = _sprite.frame
	elif _sprite is AnimatedSprite2D:
		var frames = _sprite.sprite_frames
		image.texture = frames.get_frame_texture(_sprite.animation, _sprite.frame)
	
	get_tree().current_scene.call_deferred("add_child", image)
	
	var tween = create_tween()
	tween.tween_property(image, "modulate:a", 0.0, _image_duration)
	tween.tween_callback(image.queue_free)

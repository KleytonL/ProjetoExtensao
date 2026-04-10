extends Area2D
class_name Beef

@export var value = 10

@onready var _sfx = $AudioStreamPlayer

var target = null
var speed = -0.75

func _physics_process(delta: float) -> void:
	if target != null:
		global_position = global_position.move_toward(target.global_position, speed)
		speed += 2*delta

func collect():
	hide()
	_sfx.play()
	return value

func _on_audio_stream_player_finished() -> void:
	call_deferred("queue_free")

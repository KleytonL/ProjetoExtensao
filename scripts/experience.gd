extends Area2D

@export var value = 1

@onready var _sprite = $AnimatedSprite2D
@onready var _sfx = $AudioStreamPlayer

var target = null
var speed = -0.75

func _ready():
	if value < 5:
		_sprite.play("exp_blue")
	elif value < 25:
		_sprite.play("exp_green")
	else:
		_sprite.play("exp_red")

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

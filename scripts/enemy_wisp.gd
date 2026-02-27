extends CharacterBody2D

const SPEED = 15.0

enum States {ACTIVE, HURT}
var state: States = States.ACTIVE : set = set_state

@onready var player = get_tree().get_first_node_in_group("Player")
@onready var _sprite = $Sprite2D
@onready var _animation = $AnimationTree

var knockback: Vector2 = Vector2.ZERO
var exp_base = preload("res://scenes/misc/experience.tscn")
var death_vfx = preload("res://scenes/misc/death_vfx.tscn")

func _physics_process(_delta: float) -> void:
	if player && state == States.ACTIVE:
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * SPEED
		_sprite.scale.x = -1 if velocity.x < 0 else 1
	move_and_slide()

func set_state(new_state: States) -> void:
	var state_machine = _animation.get("parameters/playback")
	var previous_state := state
	state = new_state
	
	if state == States.ACTIVE:
		state_machine.travel("active_anim")
	elif state == States.HURT:
		state_machine.travel("hurt_anim")
		velocity = knockback
		await _animation.animation_finished
		velocity = Vector2.ZERO
		if previous_state != States.HURT:
			state = previous_state
		else:
			state = States.ACTIVE

extends RigidBody2D

const SPEED = 10.0
const DAMAGE = 3

enum States {ACTIVE, HURT}
var state: States = States.ACTIVE : set = set_state

var health = 10
@onready var player = get_tree().get_first_node_in_group("Player")
@onready var _sprite = $Sprite2D
@onready var _animation = $AnimationTree

func _physics_process(delta: float) -> void:
	if player:
		var direction = global_position.direction_to(player.global_position)
		linear_velocity = direction * SPEED
		_sprite.scale.x = -1 if linear_velocity.x < 0 else 1

func set_state(new_state: States) -> void:
	var state_machine = _animation.get("parameters/playback")
	var previous_state := state
	state = new_state
	
	if state == States.ACTIVE:
		state_machine.travel("active_anim")
	elif state == States.HURT:
		state_machine.travel("hurt_anim")
		await _animation.animation_finished
		state = previous_state

func take_damage(damage: int) -> void:
	set_state(States.HURT)
	health = health - damage
	if health <= 0:
		queue_free()

func _on_hit_box_area_entered(area: Area2D) -> void:
	var knockback_direction = (player.global_position - global_position).normalized()
	if area.is_in_group("player_hurtbox"):
		player.apply_knockback(knockback_direction, 60.0)
		player.take_damage(DAMAGE)

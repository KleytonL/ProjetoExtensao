extends CharacterBody2D

const SPEED = 15.0
const DAMAGE = 2

enum States {ACTIVE, HURT}
var state: States = States.ACTIVE : set = set_state

var health = 5
@onready var player = get_tree().get_first_node_in_group("Player")
@onready var _sprite = $Sprite2D
@onready var _animation = $AnimationTree
@onready var _sfx = $AudioStreamPlayer

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

func take_damage(damage: int) -> void:
	set_state(States.HURT)
	_sfx.play()
	health = health - damage
	if health <= 0:
		var new_exp = exp_base.instantiate()
		var new_vfx = death_vfx.instantiate()
		new_exp.global_position = global_position
		new_vfx.global_position = global_position
		get_parent().call_deferred("add_child", new_exp)
		get_parent().call_deferred("add_child", new_vfx)
		queue_free()

func apply_knockback(direction: Vector2, force: float) -> void:
	knockback = direction * force

func _on_hit_box_area_entered(area: Area2D) -> void:
	var knockback_direction = (player.global_position - global_position).normalized()
	if area is HurtboxComponent:
		var hurtbox = area
		player.apply_knockback(knockback_direction, 60.0)
		player.take_damage()
		hurtbox.damage(DAMAGE)

func _on_hurt_box_area_entered(area: Area2D) -> void:
	if area.is_in_group("player_hitbox"):
		if area.get("knockback") != null:
			var knockback_direction = (global_position - area.global_position).normalized()
			apply_knockback(knockback_direction, area.knockback)
		if area.get("damage") != null:
			take_damage(area.damage)
			if area.has_method("enemy_hit"):
				area.enemy_hit(1)

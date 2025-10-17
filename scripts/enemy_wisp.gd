extends RigidBody2D

const SPEED = 25.0
const DAMAGE = 10

var health = 10
@onready var player = get_tree().get_first_node_in_group("Player")
@onready var _animation = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	_animation.play("default")
	if player:
		var direction = global_position.direction_to(player.global_position)
		linear_velocity = direction * SPEED
	_animation.flip_h = true if linear_velocity.x < 0 else false

func take_damage(damage: int) -> void:
	health = health - damage
	if health <= 0:
		queue_free()

func _on_hit_box_area_entered(area: Area2D) -> void:
	var knockback_direction = (player.global_position - global_position).normalized()
	if area.is_in_group("player_hurtbox"):
		player.apply_knockback(knockback_direction, 60.0)
		player.take_damage(DAMAGE)

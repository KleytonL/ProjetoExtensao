extends Area2D

var level = 1
var health = 1
var speed = 75
var damage = 5
var knockback = 100
var atk_size = 1.0

var target = Vector2.ZERO
var angle = Vector2.ZERO

@onready var player = get_tree().get_first_node_in_group("Player")

func _ready() -> void:
	angle = global_position.direction_to(target)
	rotation = angle.angle() + deg_to_rad(45)
	
	match level:
		1:
			health = 1
			speed = 75
			damage = 5
			knockback = 10
			atk_size = 1.0

func _physics_process(delta: float) -> void:
	position += angle * speed * delta

func enemy_hit(charge = 1):
	health -= charge
	if health <= 0:
		queue_free()

func _on_duration_timer_timeout() -> void:
	queue_free()

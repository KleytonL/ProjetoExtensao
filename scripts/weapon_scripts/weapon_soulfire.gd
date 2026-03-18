extends Area2D
class_name Soulfire

var current_level: int = 5
var health: int
var projectile_speed: int
var projectile_quantity: int
var attack_speed: int
var damage: int
var knockback: int
var atk_size: float

var target: Vector2 = Vector2.ZERO
var angle: Vector2 = Vector2.ZERO

@onready var player: Player = get_tree().get_first_node_in_group("Player")
@onready var attack_timer: Timer = $AttackTimer

func _ready() -> void:
	angle = global_position.direction_to(target)
	rotation = angle.angle() + deg_to_rad(45)
	release_attack()

func _physics_process(delta: float) -> void:
	position += angle * projectile_speed * delta

func calculate_current_level() -> void:
	match current_level:
		1:
			health = 1
			projectile_speed = 75
			projectile_quantity = 1
			attack_speed = 3
			damage = 5
			knockback = 10
			atk_size = 1.0 * (1 + player.attack_size)
		2:
			health = 1
			projectile_speed = 75
			projectile_quantity = 2
			attack_speed = 3
			damage = 5
			knockback = 10
			atk_size = 1.0 * (1 + player.attack_size)
		3:
			health = 2
			projectile_speed = 75
			projectile_quantity = 2
			attack_speed = 3
			damage = 5
			knockback = 10
			atk_size = 1.0 * (1 + player.attack_size)
		4:
			health = 2
			projectile_speed = 75
			projectile_quantity = 3
			attack_speed = 3
			damage = 5
			knockback = 10
			atk_size = 1.0 * (1 + player.attack_size)
		5:
			health = 2
			projectile_speed = 100
			projectile_quantity = 3
			attack_speed = 2
			damage = 5
			knockback = 10
			atk_size = 1.0 * (1 + player.attack_size)
		6: 
			health = 3
			projectile_speed = 100
			projectile_quantity = 5
			attack_speed = 3
			damage = 7
			knockback = 10
			atk_size = 1.0 * (1 + player.attack_size)

func release_attack() -> void:
	calculate_current_level()
	print(current_level)
	if current_level > 0:
		attack_timer.wait_time = attack_speed
		if attack_timer.is_stopped():
			attack_timer.start()

func enemy_hit(charge = 1):
	health -= charge
	if health <= 0:
		queue_free()

func _on_attack_timer_timeout() -> void:
	var attack_count = projectile_quantity
	while attack_count > 0:
		var projectile = self.duplicate()
		projectile.position = player.global_position
		projectile.target = player.attack_range.get_random_target()
		player.call_deferred("add_child", projectile)
		attack_count -= 1

func _on_duration_timer_timeout() -> void:
	queue_free()

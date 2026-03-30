extends Node2D
class_name WeaponBoomerang

var current_level: int = 1
var projectile_quantity: int = 1
var attack_speed: int = 10

@onready var attack_timer: Timer = $AttackTimer
@onready var player: Player = get_tree().get_first_node_in_group("Player")
@onready var _boomerang = preload("res://scenes/character/boomerang_projectile.tscn")

func _ready() -> void:
	release_attack()

func release_attack() -> void:
	if current_level > 0:
		attack_timer.wait_time = attack_speed
		if attack_timer.is_stopped():
			attack_timer.start()

func _on_attack_timer_timeout() -> void:
	#$BoomerangThrowSFX.play()
	var attack_count = projectile_quantity
	while attack_count > 0:
		var instance: BoomerangProjectile = _boomerang.instantiate()
		calculate_current_level(instance)
		instance.position = global_position
		instance.projectile_target = player.attack_range.get_random_target()
		player.add_child(instance)
		attack_count -= 1

func calculate_current_level(instance: BoomerangProjectile) -> void:
	match current_level:
		1:
			instance.projectile_speed = 150
			instance.projectile_acceleration = 100
			projectile_quantity = 1
			attack_speed = 10
			instance.damage = 2
			instance.knockback = 15
			instance.projectile_size = 1.0 * (1 + player.attack_size)
		2:
			instance.projectile_speed = 150
			instance.projectile_acceleration = 100
			projectile_quantity = 1
			attack_speed = 10
			instance.damage = 2
			instance.knockback = 15
			instance.projectile_size = 1.0 * (1 + player.attack_size)
		3:
			instance.projectile_speed = 150
			instance.projectile_acceleration = 100
			projectile_quantity = 2
			attack_speed = 10
			instance.damage = 2
			instance.knockback = 15
			instance.projectile_size = 1.0 * (1 + player.attack_size)
		4:
			instance.projectile_speed = 150
			instance.projectile_acceleration = 100
			projectile_quantity = 2
			attack_speed = 6
			instance.damage = 2
			instance.knockback = 15
			instance.projectile_size = 1.1 * (1 + player.attack_size)
		5:
			instance.projectile_speed = 175
			instance.projectile_acceleration = 125
			projectile_quantity = 2
			attack_speed = 6
			instance.damage = 2
			instance.knockback = 15
			instance.projectile_size = 1.1 * (1 + player.attack_size)
		6: 
			instance.projectile_speed = 175
			instance.projectile_acceleration = 125
			projectile_quantity = 3
			attack_speed = 6
			instance.damage = 3
			instance.knockback = 15
			instance.projectile_size = 1.25 * (1 + player.attack_size)

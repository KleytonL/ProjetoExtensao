extends Node2D
class_name WeaponSoulfire

var current_level: int = 1
var projectile_quantity: int = 1
var attack_speed: int = 3

@onready var attack_timer: Timer = $AttackTimer
@onready var player: Player = get_tree().get_first_node_in_group("Player")
@onready var _soulfire = preload("res://scenes/character/soulfire_projectile.tscn")

func _ready() -> void:
	release_attack()

func release_attack() -> void:
	if current_level > 0:
		attack_timer.wait_time = attack_speed
		if attack_timer.is_stopped():
			attack_timer.start()

func _on_attack_timer_timeout() -> void:
	var attack_count = projectile_quantity
	while attack_count > 0:
		var instance: SoulfireProjectile = _soulfire.instantiate()
		calculate_current_level(instance)
		instance.position = global_position
		instance.projectile_target = player.attack_range.get_random_target()
		player.add_child(instance)
		attack_count -= 1

func calculate_current_level(instance: SoulfireProjectile) -> void:
	match current_level:
		1:
			instance.health = 1
			instance.projectile_speed = 75
			projectile_quantity = 1
			attack_speed = 3
			instance.damage = 5
			instance.knockback = 10
			instance.projectile_size = 1.0 * (1 + player.attack_size)
		2:
			instance.health = 1
			instance.projectile_speed = 75
			projectile_quantity = 2
			attack_speed = 3
			instance.damage = 5
			instance.knockback = 10
			instance.projectile_size = 1.0 * (1 + player.attack_size)
		3:
			instance.health = 2
			instance.projectile_speed = 75
			projectile_quantity = 2
			attack_speed = 3
			instance.damage = 5
			instance.knockback = 10
			instance.projectile_size = 1.0 * (1 + player.attack_size)
		4:
			instance.health = 2
			instance.projectile_speed = 75
			projectile_quantity = 3
			attack_speed = 3
			instance.damage = 5
			instance.knockback = 10
			instance.projectile_size = 1.0 * (1 + player.attack_size)
		5:
			instance.health = 2
			instance.projectile_speed = 100
			projectile_quantity = 3
			attack_speed = 2
			instance.damage = 5
			instance.knockback = 10
			instance.projectile_size = 1.0 * (1 + player.attack_size)
		6: 
			instance.health = 3
			instance.projectile_speed = 100
			projectile_quantity = 5
			attack_speed = 3
			instance.damage = 7
			instance.knockback = 10
			instance.projectile_size = 1.0 * (1 + player.attack_size)

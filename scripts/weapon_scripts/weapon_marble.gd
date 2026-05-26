extends Node2D
class_name WeaponMarble

var current_level: int = 1
var projectile_quantity: int = 1
var attack_speed: float = 4.0

@onready var attack_timer: Timer = $AttackTimer
@onready var player: Player = get_tree().get_first_node_in_group("Player")
@onready var _marble = preload("res://scenes/character/marble_projectile.tscn")

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
		var instance: MarbleProjectile = _marble.instantiate()
		calculate_current_level(instance)
		instance.projectile_target = player.attack_range.get_random_target()
		instance.position = global_position
		player.add_child(instance)
		attack_count -= 1

func calculate_current_level(instance: MarbleProjectile) -> void:
	match current_level:
		1:
			instance.health = 2
			instance.projectile_speed = 90
			projectile_quantity = 1 + player.stats.bonus_projectile
			attack_speed = 4.0 - player.stats.bonus_attack_speed
			instance.damage = 1
			instance.damage_multiplier = 1.25
			instance.projectile_size = 0.75 * player.stats.bonus_projectile_size
		2:
			instance.health = 3
			instance.projectile_speed = 90
			projectile_quantity = 2 + player.stats.bonus_projectile
			attack_speed = 4.0 - player.stats.bonus_attack_speed
			instance.damage = 1
			instance.damage_multiplier = 1.25
			instance.projectile_size = 0.75 * player.stats.bonus_projectile_size
		3:
			instance.health = 3
			instance.projectile_speed = 100
			projectile_quantity = 2 + player.stats.bonus_projectile
			attack_speed = 4.0 - player.stats.bonus_attack_speed
			instance.damage = 1.5
			instance.damage_multiplier = 1.25
			instance.projectile_size = 0.75 * player.stats.bonus_projectile_size
		4:
			instance.health = 4
			instance.projectile_speed = 100
			projectile_quantity = 3 + player.stats.bonus_projectile
			attack_speed = 3.5 - player.stats.bonus_attack_speed
			instance.damage = 1.5
			instance.damage_multiplier = 1.25
			instance.projectile_size = 0.75 * player.stats.bonus_projectile_size
		5:
			instance.health = 4
			instance.projectile_speed = 120
			projectile_quantity = 3 + player.stats.bonus_projectile
			attack_speed = 3.5 - player.stats.bonus_attack_speed
			instance.damage = 2
			instance.damage_multiplier = 1.25
			instance.projectile_size = 0.85 * player.stats.bonus_projectile_size
		6: 
			instance.health = 4
			instance.projectile_speed = 120
			projectile_quantity = 3 + player.stats.bonus_projectile
			attack_speed = 3.5 - player.stats.bonus_attack_speed
			instance.damage = 2
			instance.damage_multiplier = 1.25
			instance.projectile_size = 0.85 * player.stats.bonus_projectile_size

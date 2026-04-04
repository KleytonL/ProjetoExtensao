extends Node2D
class_name WeaponThunderBlade

var current_level: int = 1
var projectile_quantity: int = 1
var attack_speed: int = 4

@onready var attack_timer: Timer = $AttackTimer
@onready var player: Player = get_tree().get_first_node_in_group("Player")
@onready var _thunder_blade = preload("res://scenes/character/thunder_blade_projectile.tscn")

func _ready() -> void:
	release_attack()

func release_attack() -> void:
	if current_level > 0:
		attack_timer.wait_time = attack_speed
		if attack_timer.is_stopped():
			attack_timer.start()

func _on_attack_timer_timeout() -> void:

	$ThunderBladeSFX.play()
	var attack_count = projectile_quantity
	while attack_count > 0:
		var instance: ThunderBladeProjectile = _thunder_blade.instantiate()
		calculate_current_level(instance)
		instance.position = player.attack_range.get_random_target()
		player.add_child(instance)
		attack_count -= 1

func calculate_current_level(instance: ThunderBladeProjectile) -> void:
	match current_level:
		1:
			projectile_quantity = 1 + player.stats.bonus_projectile
			attack_speed = 4
			instance.damage = 1
			instance.projectile_size = 1.0 * player.stats.bonus_projectile_size
		2:
			projectile_quantity = 2 + player.stats.bonus_projectile
			attack_speed = 4
			instance.damage = 1
			instance.projectile_size = 1.0 * player.stats.bonus_projectile_size
		3:
			projectile_quantity = 2 + player.stats.bonus_projectile
			attack_speed = 3
			instance.damage = 1
			instance.projectile_size = 1.0 * player.stats.bonus_projectile_size
		4:
			projectile_quantity = 3 + player.stats.bonus_projectile
			attack_speed = 3
			instance.damage = 2
			instance.projectile_size = 1.0 * player.stats.bonus_projectile_size
		5:
			projectile_quantity = 3 + player.stats.bonus_projectile
			attack_speed = 2
			instance.damage = 2
			instance.projectile_size = 1.0 * player.stats.bonus_projectile_size
		6: 
			projectile_quantity = 5 + player.stats.bonus_projectile
			attack_speed = 2
			instance.damage = 3
			instance.projectile_size = 1.0 * player.stats.bonus_projectile_size

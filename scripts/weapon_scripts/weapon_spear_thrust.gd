extends Node2D
class_name WeaponSpearThrust

var current_level: int = 1
var spear_quantity: int = 1
var recharge_speed: float = 5.0
var current_active: int = 0

@onready var recharge_timer: Timer = $RechargeTimer
@onready var player: Player = get_tree().get_first_node_in_group("Player")
@onready var _spear_thrust = preload("res://scenes/character/spear_thrust.tscn")

func _ready() -> void:
	release_attack()

func release_attack() -> void:
	if current_level > 0:
		recharge_timer.wait_time = recharge_speed
		if recharge_timer.is_stopped():
			recharge_timer.start()

func _on_recharge_timer_timeout() -> void:
	$ThrustSFX.play()
	var spear_count = spear_quantity
	for i in spear_count:
		var instance: SpearThrust = _spear_thrust.instantiate()
		instance.angle = (TAU / spear_count) * i
		calculate_current_level(instance)
		player.add_child(instance)

func calculate_current_level(instance: SpearThrust) -> void:
	match current_level:
		1:
			instance.damage = 1
			instance.duration = 0.5
			instance.spear_size = 0.75 * player.stats.bonus_projectile_size
			recharge_speed = 6.0 - player.stats.bonus_attack_speed
			spear_quantity = 1 + player.stats.bonus_projectile
		2:
			instance.damage = 1
			instance.duration = 0.5
			instance.spear_size = 0.85 * player.stats.bonus_projectile_size
			recharge_speed = 6.0 - player.stats.bonus_attack_speed
			spear_quantity = 1 + player.stats.bonus_projectile
		3:
			instance.damage = 1.5
			instance.duration = 1.0
			instance.spear_size = 1.0 * player.stats.bonus_projectile_size
			recharge_speed = 6.0 - player.stats.bonus_attack_speed
			spear_quantity = 2 + player.stats.bonus_projectile
		4:
			instance.damage = 1.5
			instance.duration = 1.0
			instance.spear_size = 1.0 * player.stats.bonus_projectile_size
			recharge_speed = 4.5 - player.stats.bonus_attack_speed
			spear_quantity = 2 + player.stats.bonus_projectile
		5:
			instance.damage = 3
			instance.duration = 1.5
			instance.spear_size = 1.0 * player.stats.bonus_projectile_size
			recharge_speed = 4.5 - player.stats.bonus_attack_speed
			spear_quantity = 2 + player.stats.bonus_projectile
		6:
			instance.damage = 3
			instance.duration = 1.5
			instance.spear_size = 1.1 * player.stats.bonus_projectile_size
			recharge_speed = 4.0 - player.stats.bonus_attack_speed
			spear_quantity = 3 + player.stats.bonus_projectile

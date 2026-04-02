extends Node2D
class_name OrbitalShield

var current_level: int = 1
var orb_quantity: int = 1
var recharge_speed: int = 4
var current_active: int = 0

@onready var recharge_timer: Timer = $RechargeTimer
@onready var player: Player = get_tree().get_first_node_in_group("Player")
@onready var _shield_orb = preload("res://scenes/character/shield_orb.tscn")

func _ready() -> void:
	release_attack()

func release_attack() -> void:
	if current_level > 0:
		recharge_timer.wait_time = recharge_speed
		if recharge_timer.is_stopped():
			recharge_timer.start()

func _on_recharge_timer_timeout() -> void:
	if current_active == 0:
		$ShieldUpSFX.play()
		var orb_count = orb_quantity
		for i in orb_count:
			var instance: ShieldOrb = _shield_orb.instantiate()
			instance.angle = (TAU / orb_count) * i
			instance.on_orb_duration_timeout.connect(calculate_recharge)
			calculate_current_level(instance)
			player.add_child(instance)
			current_active += 1

func calculate_recharge() -> void:
	current_active -= 1
	if current_active == 0:
		$ShieldDownSFX.play()
		recharge_timer.start()

func calculate_current_level(instance: ShieldOrb) -> void:
	match current_level:
		1:
			instance.damage = 1
			instance.duration = 3
			instance.orb_size = 1.0 * player.stats.bonus_projectile_size
			recharge_speed = 4
			orb_quantity = 1 + player.stats.bonus_projectile
			instance.knockback = 15
			instance.rotation_speed = 1.5
			instance.orbit_radius = 25
		2:
			instance.damage = 2
			instance.duration = 3
			instance.orb_size = 1.0 * player.stats.bonus_projectile_size
			recharge_speed = 4
			orb_quantity = 2 + player.stats.bonus_projectile
			instance.knockback = 15
			instance.rotation_speed = 1.5
			instance.orbit_radius = 25
		3:
			instance.damage = 2
			instance.duration = 5
			instance.orb_size = 1.0 * player.stats.bonus_projectile_size
			recharge_speed = 4
			orb_quantity = 2 + player.stats.bonus_projectile
			instance.knockback = 20
			instance.rotation_speed = 1.75
			instance.orbit_radius = 25
		4:
			instance.damage = 3
			instance.duration = 5
			instance.orb_size = 1.0 * player.stats.bonus_projectile_size
			recharge_speed = 3
			orb_quantity = 3 + player.stats.bonus_projectile
			instance.knockback = 20
			instance.rotation_speed = 1.75
			instance.orbit_radius = 25
		5:
			instance.damage = 3
			instance.duration = 7
			instance.orb_size = 1.0 * player.stats.bonus_projectile_size
			recharge_speed = 3
			orb_quantity = 3 + player.stats.bonus_projectile
			instance.knockback = 20
			instance.rotation_speed = 2
			instance.orbit_radius = 30
		6:
			instance.damage = 4
			instance.duration = 7
			instance.orb_size = 1.2 * player.stats.bonus_projectile_size
			recharge_speed = 2
			orb_quantity = 4 + player.stats.bonus_projectile
			instance.knockback = 25
			instance.rotation_speed = 2.5
			instance.orbit_radius = 30

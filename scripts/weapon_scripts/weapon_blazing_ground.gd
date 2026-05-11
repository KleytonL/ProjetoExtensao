extends Node2D
class_name WeaponBlazingGround

var current_level: int = 1
var area_quantity: int = 1
var attack_speed: float = 8.5

@onready var attack_timer: Timer = $AttackTimer
@onready var player: Player = get_tree().get_first_node_in_group("Player")
@onready var _blazing_ground = preload("res://scenes/character/blazing_ground.tscn")

func _ready() -> void:
	release_attack()

func release_attack() -> void:
	if current_level > 0:
		attack_timer.wait_time = attack_speed
		if attack_timer.is_stopped():
			attack_timer.start()

func _on_attack_timer_timeout() -> void:
#	$SoulfireShotSFX.play()
	var attack_count = area_quantity
	while attack_count > 0:
		var instance: BlazingGround = _blazing_ground.instantiate()
		calculate_current_level(instance)
		instance.global_position = player.attack_range.get_random_position()
		get_tree().current_scene.add_child(instance)
		attack_count -= 1

func calculate_current_level(instance: BlazingGround) -> void:
	match current_level:
		1:
			area_quantity = 1 + player.stats.bonus_projectile
			attack_speed = 8.5 - player.stats.bonus_attack_speed
			instance.damage = 1
			instance.projectile_size = 1.0 * player.stats.bonus_projectile_size
		2:
			area_quantity = 2 + player.stats.bonus_projectile
			attack_speed = 8.5 - player.stats.bonus_attack_speed
			instance.damage = 1
			instance.projectile_size = 1.0 * player.stats.bonus_projectile_size
		3:
			area_quantity = 2 + player.stats.bonus_projectile
			attack_speed = 8.5 - player.stats.bonus_attack_speed
			instance.damage = 1.5
			instance.projectile_size = 1.0 * player.stats.bonus_projectile_size
		4:
			area_quantity = 3 + player.stats.bonus_projectile
			attack_speed = 8.5 - player.stats.bonus_attack_speed
			instance.damage = 1.5
			instance.projectile_size = 1.0 * player.stats.bonus_projectile_size
		5:
			area_quantity = 3 + player.stats.bonus_projectile
			attack_speed = 2.5 - player.stats.bonus_attack_speed
			instance.damage = 2
			instance.projectile_size = 1.0 * player.stats.bonus_projectile_size
		6: 
			area_quantity = 5 + player.stats.bonus_projectile
			attack_speed = 2.5 - player.stats.bonus_attack_speed
			instance.damage = 2
			instance.projectile_size = 1.0 * player.stats.bonus_projectile_size

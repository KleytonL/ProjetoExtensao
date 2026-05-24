extends Node2D
class_name WeaponRadiance

var current_level: int = 1 :
	set(value):
		current_level = value
		if is_node_ready():
			update_radiance_instance()

var radiance_instance: Radiance
@onready var player: Player = get_tree().get_first_node_in_group("Player")
@onready var _radiance = preload("res://scenes/character/radiance_area.tscn")

func _ready() -> void:
	player.stats.update_stats.connect(update_radiance_instance)
	release_attack()

func release_attack() -> void:
	if current_level > 0:
		radiance_instance = _radiance.instantiate()
		calculate_current_level(radiance_instance)
		radiance_instance.position = Vector2.ZERO
		player.add_child(radiance_instance)

func update_radiance_instance() -> void:
	if radiance_instance == null:
		return
	
	calculate_current_level(radiance_instance)
	radiance_instance.update_stats()

func calculate_current_level(instance: Radiance) -> void:
	match current_level:
		1:
			instance.damage = 1.0
			instance.tick_speed = 1.5 - player.stats.bonus_attack_speed
			instance.area_size = 1.0 * player.stats.bonus_projectile_size
		2:
			instance.damage = 1.25
			instance.tick_speed = 1.4 - player.stats.bonus_attack_speed
			instance.area_size = 1.05 * player.stats.bonus_projectile_size
		3:
			instance.damage = 1.5
			instance.tick_speed = 1.3 - player.stats.bonus_attack_speed
			instance.area_size = 1.1 * player.stats.bonus_projectile_size
		4:
			instance.damage = 1.75
			instance.tick_speed = 1.2 - player.stats.bonus_attack_speed
			instance.area_size = 1.25 * player.stats.bonus_projectile_size
		5:
			instance.damage = 2.0
			instance.tick_speed = 1.1 - player.stats.bonus_attack_speed
			instance.area_size = 1.25 * player.stats.bonus_projectile_size
		6:
			instance.damage = 2.5
			instance.tick_speed = 1.0 - player.stats.bonus_attack_speed
			instance.area_size = 1.3 * player.stats.bonus_projectile_size

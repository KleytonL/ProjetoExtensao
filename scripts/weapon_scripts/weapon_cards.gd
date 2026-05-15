extends Node2D
class_name WeaponCards

var current_level: int = 1
var projectile_quantity: int = 3
var attack_speed: float = 5.0

@onready var attack_timer: Timer = $AttackTimer
@onready var player: Player = get_tree().get_first_node_in_group("Player")
@onready var _card = preload("res://scenes/character/card_projectile.tscn")

func _ready() -> void:
	release_attack()

func release_attack() -> void:
	if current_level > 0:
		attack_timer.wait_time = attack_speed
		if attack_timer.is_stopped():
			attack_timer.start()

func _on_attack_timer_timeout() -> void:
#	$SoulfireShotSFX.play()
	var attack_count = projectile_quantity
	while attack_count > 0:
		await get_tree().create_timer(0.1).timeout
		var attack_color: int = randi_range(1, 3)
		var instance: CardProjectile = _card.instantiate()
		calculate_current_level(instance)
		instance.position = global_position
		instance.sprite_color = attack_color
		instance.projectile_target = player.attack_range.get_random_target() 
		player.add_child(instance)
		attack_count -= 1

func calculate_current_level(instance: CardProjectile) -> void:
	match current_level:
		1:
			instance.health = 2
			instance.projectile_speed = 75
			projectile_quantity = 3 + player.stats.bonus_projectile
			attack_speed = 3.0 - player.stats.bonus_attack_speed
			instance.damage = 1
			instance.projectile_size = 1.0 * player.stats.bonus_projectile_size
		2:
			instance.health = 2
			instance.projectile_speed = 75
			projectile_quantity = 2 + player.stats.bonus_projectile
			attack_speed = 3.0 - player.stats.bonus_attack_speed
			instance.damage = 1
			instance.projectile_size = 1.0 * player.stats.bonus_projectile_size
		3:
			instance.health = 2
			instance.projectile_speed = 75
			projectile_quantity = 2 + player.stats.bonus_projectile
			attack_speed = 3.0 - player.stats.bonus_attack_speed
			instance.damage = 1
			instance.projectile_size = 1.0 * player.stats.bonus_projectile_size
		4:
			instance.health = 2
			instance.projectile_speed = 75
			projectile_quantity = 3 + player.stats.bonus_projectile
			attack_speed = 3.0 - player.stats.bonus_attack_speed
			instance.damage = 1
			instance.projectile_size = 1.0 * player.stats.bonus_projectile_size
		5:
			instance.health = 2
			instance.projectile_speed = 100
			projectile_quantity = 3 + player.stats.bonus_projectile
			attack_speed = 2.5 - player.stats.bonus_attack_speed
			instance.damage = 1
			instance.projectile_size = 1.0 * player.stats.bonus_projectile_size
		6: 
			instance.health = 3
			instance.projectile_speed = 100
			projectile_quantity = 5 + player.stats.bonus_projectile
			attack_speed = 2.5 - player.stats.bonus_attack_speed
			instance.damage = 7
			instance.projectile_size = 1.0 * player.stats.bonus_projectile_size

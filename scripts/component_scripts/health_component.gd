extends Node
class_name HealthComponent

const healing_number = preload("res://scenes/misc/gui/healing_number.tscn")

@onready var death = get_tree().get_first_node_in_group("DeathScreen")
@export var stats_component: StatsComponent
@export var freeze_component: FrameFreezeComponent
@export var max_health: int
var base_health: int
var health: int

signal update_healthbar

func _ready() -> void:
	stats_component.update_stats.connect(update_max_health)
	base_health = max_health
	health = max_health

func damage(attack: int) -> void:
	@warning_ignore("narrowing_conversion")
	health -= max(1, floor(attack * (1.0 - stats_component.bonus_defense)))
	$sfx_damage.play()
	emit_signal("update_healthbar")
	if health <= 0:
		if freeze_component:
			freeze_component.run_ending_freeze(0.01, 0.35)
			await freeze_component.freeze_finished
		death.pause()

func update_health(value: int) -> void:
	health += value
	if health > max_health:
		health = max_health
	spawn_heal_number(value)
	emit_signal("update_healthbar")

func update_max_health() -> void:
	var old_health = max_health
	max_health = base_health + stats_component.bonus_health
	health += max_health - old_health
	if health > max_health:
		health = max_health
	emit_signal("update_healthbar")

func spawn_heal_number(heal: int) -> void:
	var number: HealingNumber = healing_number.instantiate()
	var offset: Vector2 = Vector2(randf_range(-6, 6), randf_range(-12, 12))
	
	number.position = owner.global_position + offset
	
	get_tree().current_scene.add_child(number)
	number.setup(heal)

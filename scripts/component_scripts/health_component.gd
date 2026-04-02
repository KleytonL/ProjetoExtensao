extends Node
class_name HealthComponent

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
	health -= attack
	$sfx_damage.play()
	emit_signal("update_healthbar")
	if health <= 0:
		if freeze_component:
			freeze_component.fade_in_freeze(0.01, 0.75)
			await freeze_component.freeze_finished
		death.pause()

func update_health(value: int) -> void:
	health += value
	emit_signal("update_healthbar")

func update_max_health() -> void:
	var old_health = max_health
	max_health = base_health + stats_component.bonus_health
	update_health(max_health - old_health)
	emit_signal("update_healthbar")

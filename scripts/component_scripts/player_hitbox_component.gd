extends Area2D
class_name PlayerHitboxComponent

@export var damage: float = 2.0
@export var force: float = 30.0
@export var camera: Camera2D
@export var freeze_component: FrameFreezeComponent
@export var stats_component: StatsComponent
@export var health_component: HealthComponent
@export var apply_damage_bonus: bool
var _base_damage: float
var direction: Vector2
var can_vamp: bool
var is_crit: bool

func _ready() -> void:
	_base_damage = damage
	if not stats_component:
		stats_component = GameLogic.player.stats
	if not health_component:
		health_component = GameLogic.player.health

func _on_area_entered(area: Area2D) -> void:
	direction = (area.global_position - get_parent().global_position).normalized()
	
	if area is EnemyHurtboxComponent:
		if stats_component:
			if apply_damage_bonus:
				damage = _base_damage + stats_component.bonus_damage
			
			is_crit = randf() < stats_component.bonus_crit_chance
			if is_crit:
				damage *= stats_component.bonus_crit_multiplier
			
			
			@warning_ignore("narrowing_conversion")
			var vamp: int = damage * stats_component.bonus_vampirism
			if vamp < 1:
				can_vamp = randf() < vamp * 0.25
				if can_vamp:
					health_component.update_health(1)
			else:
				can_vamp = randf() < 0.25
				if can_vamp:
					health_component.update_health(floor(vamp))
			
		if freeze_component:
			freeze_component.activate(0.01, 0.5)
			
		if camera:
			camera.shake_camera()
			
		area.damage(self)

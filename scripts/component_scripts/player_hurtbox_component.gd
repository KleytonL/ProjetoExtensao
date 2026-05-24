extends Area2D
class_name PlayerHurtboxComponent

@export var health_component: HealthComponent
@export var knockback_component: KnockbackComponent
var hit_frame: bool = false

func damage(attack: EnemyHitboxComponent) -> void:
	if hit_frame:
		return
	hit_frame = true
	if health_component:
		health_component.damage(attack.damage)
	if knockback_component:
		knockback_component.apply_direction(attack.direction * attack.force)

extends Area2D
class_name PlayerHurtboxComponent

@export var health_component: HealthComponent
@export var knockback_component: KnockbackComponent

func damage(attack: EnemyHitboxComponent) -> void:
	if health_component:
		health_component.damage(attack.damage)
	if knockback_component:
		knockback_component.apply_direction(attack.direction)

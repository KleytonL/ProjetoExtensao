extends Area2D
class_name EnemyHurtboxComponent

@export var health_component: EnemyHealthComponent
@export var knockback_component: KnockbackComponent

func damage(attack: PlayerHitboxComponent) -> void:
	if health_component:
		health_component.damage(attack.damage)
	if knockback_component:
		knockback_component.apply_direction(attack.direction * attack.force)

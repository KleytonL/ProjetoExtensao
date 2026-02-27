extends Area2D
class_name EnemyHurtboxComponent

@export var health_component: HealthComponent
@export var knockback_component: KnockbackComponent

func damage(attack: PlayerHitboxComponent) -> void:
	if health_component:
		health_component.damage_enemy(attack.damage)
	if knockback_component:
		knockback_component.apply(attack.direction)

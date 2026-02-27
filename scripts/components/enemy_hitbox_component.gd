extends Area2D
class_name EnemyHitboxComponent

@export var damage: int
var direction: Vector2

func _on_area_entered(area: Area2D) -> void:
	direction = (area.global_position - get_parent().global_position).normalized()
	if area is PlayerHurtboxComponent:
		var hurtbox = area
		hurtbox.damage(self)

extends Area2D
class_name PlayerHitboxComponent

@export var damage: int
var direction: Vector2

func _on_area_entered(area: Area2D) -> void:
	direction = (area.global_position - get_parent().global_position).normalized()
	if area is EnemyHurtboxComponent:
		var hurtbox = area
		hurtbox.damage(self)

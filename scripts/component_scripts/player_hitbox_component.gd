extends Area2D
class_name PlayerHitboxComponent

@export var damage: int
@export var camera: Camera2D
@export var freeze_component: FrameFreezeComponent
var direction: Vector2

func _on_area_entered(area: Area2D) -> void:
	direction = (area.global_position - get_parent().global_position).normalized()
	if area is EnemyHurtboxComponent:
		var hurtbox = area
		hurtbox.damage(self)
		if freeze_component:
			freeze_component.activate(0.01, 0.5)
		camera.shake_camera()

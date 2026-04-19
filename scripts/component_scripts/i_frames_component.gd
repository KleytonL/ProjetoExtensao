extends Node
class_name iFramesComponent

@export var hurtbox_component: PlayerHurtboxComponent
var active: bool

func activate_iframes(time: float) -> void:
	hurtbox_component.monitorable = false
	hurtbox_component.monitoring = false
	await get_tree().create_timer(time).timeout
	hurtbox_component.monitorable = true
	hurtbox_component.monitoring = true
	check_overlaps()

func check_overlaps() -> void:
	await get_tree().process_frame
	for area in hurtbox_component.get_overlapping_areas():
		if area is EnemyHitboxComponent:
			hurtbox_component.damage(area)
			break

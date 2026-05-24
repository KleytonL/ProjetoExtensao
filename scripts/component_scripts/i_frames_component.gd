extends Node
class_name iFramesComponent

@export var hurtbox_component: PlayerHurtboxComponent
var active: bool

func activate_iframes(time: float) -> void:
	active = true
	hurtbox_component.monitorable = false
	hurtbox_component.monitoring = false
	await get_tree().create_timer(time).timeout
	hurtbox_component.monitorable = true
	hurtbox_component.monitoring = true
	hurtbox_component.hit_frame = false
	active = false
	check_overlaps()

func check_overlaps() -> void:
	if active:
		return
	await get_tree().process_frame
	if hurtbox_component.monitoring == false:
		return
	for area in hurtbox_component.get_overlapping_areas():
		if area is EnemyHitboxComponent:
			hurtbox_component.damage(area)
			break

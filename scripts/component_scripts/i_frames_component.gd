extends Node
class_name iFramesComponent

@export var hurtbox_component: PlayerHurtboxComponent
var remaining_time: float = 0.0
var active: bool

func activate_iframes(time: float) -> void:
	if time > remaining_time:
		remaining_time = time
	if active:
		return
	active = true
	hurtbox_component.monitorable = false
	hurtbox_component.monitoring = false
	while remaining_time > 0:
		await  get_tree().process_frame
		remaining_time -= get_process_delta_time()
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

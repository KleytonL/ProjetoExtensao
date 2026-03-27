extends Node
class_name iFramesComponent

@export var hurtbox_component: PlayerHurtboxComponent
var active: bool

func activate_iframes(time: float) -> void:
	hurtbox_component.monitorable = false
	await get_tree().create_timer(time).timeout
	hurtbox_component.monitorable = true

extends Node
class_name ExperienceComponent

@export var upgrade_panel: UpgradePanel
@export var freeze_component: FrameFreezeComponent

var level: int = 1
var experience: int = 0
var collected_experience: int = 0
var total_experience: int = 0
var is_upgrading: bool = false

signal update_experiencebar

func _ready() -> void:
	if SaveManager.meta_upgrades["bonus_level"]["level"] != 0:
		level += 1
		await get_tree().create_timer(2.0).timeout
		upgrade_panel.level_up()

func calculate_exp(exp_value: int = 0):
	collected_experience += exp_value
	total_experience += collected_experience
	
	if is_upgrading:
		return
	
	is_upgrading = true
	
	while true:
		var exp_required = exp_capacity()
		if experience + collected_experience >= exp_required:
			collected_experience -= exp_required - experience
			level += 1
			experience = 0
			if freeze_component:
				freeze_component.fade_in_freeze(0.01, 0.25)
				await freeze_component.freeze_finished
			await get_tree().process_frame
			upgrade_panel.level_up()
			await upgrade_panel.panel_closed
		else:
			experience += collected_experience
			collected_experience = 0
			break
	
	is_upgrading = false
	emit_signal("update_experiencebar")

func exp_capacity():
	var exp_cap = level
	if level < 20:
		exp_cap = level * 5
	elif level < 40:
		exp_cap = 95 + (level - 19) * 8
	else:
		exp_cap = 255 + (level - 39) * 12
	return exp_cap

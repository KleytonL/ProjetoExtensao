extends Node
class_name ExperienceComponent

@export var upgrade_panel: UpgradePanel
@export var freeze_component: FrameFreezeComponent

var level = 1
var experience = 0
var collected_experience = 0

signal update_experiencebar

func calculate_exp(exp_value):
	var exp_required = exp_capacity()
	collected_experience += exp_value
	if experience + collected_experience >= exp_required:
		collected_experience -= exp_required - experience
		level += 1
		experience = 0
		if freeze_component:
			freeze_component.fade_in_freeze(0.01, 0.25)
			await freeze_component.freeze_finished
		upgrade_panel.level_up()
	else:
		experience += collected_experience
		collected_experience = 0
	emit_signal("update_experiencebar")

func exp_capacity():
	var exp_cap = level
	if level < 20:
		exp_cap = level * 5
	elif level < 40:
		exp_cap = 95 * (level - 19) * 8
	else:
		exp_cap = 255 + (level - 39) * 12
	return exp_cap

extends Panel
class_name UpgradePanel

@export var freeze_component: FrameFreezeComponent

var upgrade_options: Array = []
var max_options: int = 3

@onready var _grid: VBoxContainer = $Grid
@onready var _item_options = preload("res://scenes/misc/gui/item_option.tscn")

signal panel_closed

func level_up():
	$AnimationPlayer.play("show_animation")
	GameLogic.can_pause = false
	self.visible = true
	
	for i in max_options:
		var option_choice = _item_options.instantiate()
		option_choice.item = get_random_item()
		_grid.add_child(option_choice)
	
	_grid.get_child(0).grab_focus()
	get_tree().paused = true

func get_random_item():
	var weapons_collected: int = count_by_type("weapon")
	var stats_collected: int = count_by_type("stats")
	var datalist: Array = []
	
	for i in UpgradeDatabase.UPGRADES:
		if i in GameLogic.upgrades_collected or i in upgrade_options:
			continue
		
		var type = UpgradeDatabase.UPGRADES[i]["type"]
		
		if type == "consumable":
			continue
		
		var prerequisite = UpgradeDatabase.UPGRADES[i]["prerequisite"]
		var is_collected: bool = false
		
		if prerequisite.size() > 0:
			var can_add = true
			for n in prerequisite:
				if n not in GameLogic.upgrades_collected:
					can_add = false
					break
				else:
					is_collected = true
			if not can_add:
				continue
		
		if not is_collected:
			if type == "weapon" and weapons_collected >= GameLogic.max_weapons:
				continue
			if type == "stats" and stats_collected >= GameLogic.max_stats:
				continue
		
		datalist.append(i)
	
	if datalist.is_empty():
		return null
	
	var random_item = datalist.pick_random()
	upgrade_options.append(random_item)
	return random_item

func count_by_type(type: String) -> int:
	var unique_keys: Array = []
	for item in GameLogic.upgrades_collected:
		if UpgradeDatabase.UPGRADES[item]["type"] == type:
			var key = UpgradeDatabase.UPGRADES[item]["key"]
			if key not in unique_keys:
				unique_keys.append(key)
	return unique_keys.size()

func close_and_save(item) -> void:
	$AnimationPlayer.play_backwards("show_animation")
	
	var option_children = _grid.get_children()
	for i in option_children:
		i.disabled = true
	
	await $AnimationPlayer.animation_finished
	
	for i in option_children:
		i.queue_free()
	
	upgrade_options.clear()
	GameLogic.upgrades_collected.append(item)
	
	emit_signal("panel_closed")
	
	self.visible = false
	get_tree().paused = false
	freeze_component.fade_out_freeze(0.1, 0.5)
	GameLogic.can_pause = true

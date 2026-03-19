extends Panel
class_name UpgradePanel

var upgrades_collected = []
var upgrade_options = []
var max_options = 3

@onready var _grid: VBoxContainer = $Grid
@onready var _item_options = preload("res://scenes/misc/gui/item_option.tscn")

func level_up():
	self.visible = true
	var options = 0
	while options < max_options:
		var option_choice = _item_options.instantiate()
		option_choice.item = get_random_item()
		_grid.add_child(option_choice)
		options += 1
	_grid.get_child(0).grab_focus()
	get_tree().paused = true

func get_random_item():
	var datalist = []
	for i in UpgradeDatabase.UPGRADES:
		if i in upgrades_collected or i in upgrade_options:
			pass
		elif UpgradeDatabase.UPGRADES[i]["type"] == "item":
			pass
		elif UpgradeDatabase.UPGRADES[i]["prerequisite"].size() > 0:
			var to_add = true
			for n in UpgradeDatabase.UPGRADES[i]["prerequisite"]:
				if not n in upgrades_collected:
					to_add = false
			if to_add:
				datalist.append(i)
		else: 
			datalist.append(i)
	if datalist.size() > 0:
		var random_item = datalist.pick_random()
		upgrade_options.append(random_item)
		return random_item
	else:
		return null

func close_and_save(item):
	var option_children = _grid.get_children()
	for i in option_children:
		i.queue_free()
	upgrade_options.clear()
	upgrades_collected.append(item)
	self.visible = false
	get_tree().paused = false

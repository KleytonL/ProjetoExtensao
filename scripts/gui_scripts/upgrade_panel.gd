extends Panel
class_name UpgradePanel

var upgrades_collected = []
var upgrade_options = []
var max_options = 3

@onready var _grid: VBoxContainer = $Grid
@onready var _item_options = preload("res://scenes/misc/item_option.tscn")

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

func upgrade_character(upgrade):
	if upgrade.contains("soulfire"):
		print("Soulfire Upgrade")
	elif upgrade.contains("shield"):
		print("Shield Upgrade")
#		"soulfire2":
#			soulfire_level += 1
#			soulfire_amount += 1
#		"soulfire3":
#			soulfire_level += 1
#		"soulfire4":
#			soulfire_level += 1
#			soulfire_amount += 1
#		"soulfire5":
#			soulfire_level += 1
#			soulfire_atkspeed -= 1
#		"soulfire6":
#			soulfire_level += 1
#			soulfire_amount += 2
#		"shield1":
#			shield_level = 1
			#orbital_shield.activate()
#		"shield2":
#			shield_level = 2
#			shield_damage = 2
			#orbital_shield.set_orb_count(2)
			#orbital_shield.set_damage(shield_damage)
#		"shield3":
#			shield_level = 3
#			shield_damage = 4
			#orbital_shield.set_damage(shield_damage)
			#orbital_shield.set_recharge_time(2.0)
#		"shield4":
#			shield_level = 4
#			shield_orb_count = 3
			#orbital_shield.set_orb_count(3)
#		"shield5":
#			shield_level = 5
#			shield_orb_count = 4
			#orbital_shield.set_orb_count(4)
#		"shield6":
#			shield_level = 6
#			shield_damage = 5
			#orbital_shield.set_damage(shield_damage)
			#orbital_shield.set_recharge_time(1.5)
			#orbital_shield.rotation_speed = 2.5
#		"food":
#			health += 5
#			health = clamp(health, 0, max_health)

	var option_children = _grid.get_children()
	for i in option_children:
		i.queue_free()
	upgrade_options.clear()
	upgrades_collected.append(upgrade)
	self.visible = false
	get_tree().paused = false

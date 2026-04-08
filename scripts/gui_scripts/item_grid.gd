extends Control
class_name ItemGrid

var collected_upgrades: Array = []

func update_grid(item: String) -> void:
	var type = UpgradeDatabase.UPGRADES[item]["type"]
	if type == "consumable":
		return
	var key = UpgradeDatabase.UPGRADES[item]["key"]
	if type != "item":
		if not key in collected_upgrades:
			var item_icon = TextureRect.new()
			item_icon.texture = load(UpgradeDatabase.UPGRADES[item]["icon"])
			match type:
				"weapon":
					$WeaponGrid.add_child(item_icon)
				"stats":
					$StatsGrid.add_child(item_icon)
			collected_upgrades.append(key)

extends Panel
class_name MetaShopPanel

var focused: bool = false
@onready var _grid: GridContainer = $Grid
@onready var _label: Label = $Label
@onready var _shop_options = preload("res://scenes/misc/gui/shop_option.tscn")

func _ready() -> void:
	update_values()
	populate_grid()

func on_focus() -> void:
	if focused:
		return
	$AnimationPlayer.play("show_animation")
	focused = true
	for i in _grid.get_children():
		i.disabled = false

func out_of_focus() -> void:
	if not focused:
		return
	$AnimationPlayer.play_backwards("show_animation")
	focused = false
	for i in _grid.get_children():
		i.disabled = true

func populate_grid() -> void:
	for i in UpgradeDatabase.SHOP:
		var option_choice = _shop_options.instantiate()
		option_choice.item = i
		_grid.add_child(option_choice)

func update_values() -> void:
	_label.text = str("Essências: ", SaveManager.essences_collected)
	for i in _grid.get_children():
		i.update_values()

func handle_purchase(item: String) -> void:
	var data = UpgradeDatabase.SHOP[item]
	var level = SaveManager.meta_upgrades[item]["level"]
	
	if level >= data.max_level:
		return
	
	var price = data.price[level]
	
	if SaveManager.essences_collected < price:
		return
	
	SaveManager.essences_collected -= price
	SaveManager.meta_upgrades[item]["level"] += 1
	SaveManager.meta_upgrades[item]["value"] += UpgradeDatabase.SHOP[item]["value"]
	SaveManager.save()
	update_values()

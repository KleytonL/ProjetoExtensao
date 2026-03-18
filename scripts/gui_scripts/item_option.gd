extends Button

var item = null

@onready var _panel = get_tree().get_first_node_in_group("Panel")
@onready var _name = $lbl_name
@onready var _description = $lbl_description
@onready var _level = $lbl_level
@onready var _icon = $ColorRect/ItemIcon

signal selected_upgrade(upgrade)

func _ready() -> void:
	connect("selected_upgrade", Callable(_panel, "upgrade_character"))
	
	if item == null:
		item = "food"
	_name.text = UpgradeDatabase.UPGRADES[item]["displayname"]
	_description.text = UpgradeDatabase.UPGRADES[item]["details"]
	_level.text = UpgradeDatabase.UPGRADES[item]["level"]
	_icon.texture = load(UpgradeDatabase.UPGRADES[item]["icon"])

func _on_pressed() -> void:
	emit_signal("selected_upgrade", item)

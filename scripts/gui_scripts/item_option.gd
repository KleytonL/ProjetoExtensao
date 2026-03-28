extends Button

var item = null
var type = null

@onready var _controller: UpgradeController = get_tree().get_first_node_in_group("UpgradeController")
@onready var _panel: Panel = get_tree().get_first_node_in_group("UpgradePanel")

signal selected_upgrade(item)

func _ready() -> void:
	connect("selected_upgrade", Callable(_controller, "handle_upgrade"))
	connect("selected_upgrade", Callable(_panel, "close_and_save"))
	
	if item == null:
		item = "food"
	
	type = UpgradeDatabase.UPGRADES[item]["type"]
	$NameLabel.text = UpgradeDatabase.UPGRADES[item]["displayname"]
	$DescriptionLabel.text = UpgradeDatabase.UPGRADES[item]["details"]
	$LevelLabel.text = UpgradeDatabase.UPGRADES[item]["level"]
	$ItemIcon.texture = load(UpgradeDatabase.UPGRADES[item]["icon"])

func _on_pressed() -> void:
	emit_signal("selected_upgrade", item)

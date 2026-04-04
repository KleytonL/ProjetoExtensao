extends TextureButton

var item = null
var type = null

@onready var _controller: UpgradeController = get_tree().get_first_node_in_group("UpgradeController")
@onready var _panel: Panel = get_tree().get_first_node_in_group("UpgradePanel")
@onready var _item_grid: Control = get_tree().get_first_node_in_group("ItemGrid")
@onready var _hover: AudioStreamPlayer = $HoverSFX
@onready var _click: AudioStreamPlayer = $ClickSFX

signal selected_upgrade(item)

func _ready() -> void:
	connect("selected_upgrade", Callable(_controller, "handle_upgrade"))
	connect("selected_upgrade", Callable(_item_grid, "update_grid"))
	connect("selected_upgrade", Callable(_panel, "close_and_save"))
	
	if item == null:
		item = "food"
	
	type = UpgradeDatabase.UPGRADES[item]["type"]
	$NameLabel.text = UpgradeDatabase.UPGRADES[item]["displayname"]
	$DescriptionLabel.text = UpgradeDatabase.UPGRADES[item]["details"]
	$LevelLabel.text = UpgradeDatabase.UPGRADES[item]["level"]
	$ItemIcon.texture = load(UpgradeDatabase.UPGRADES[item]["icon"])

func _on_focus_entered() -> void:
	_hover.play()

func _on_pressed() -> void:
	_click.play()
	emit_signal("selected_upgrade", item)

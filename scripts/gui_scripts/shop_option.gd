extends TextureButton
class_name ShopOption

var item = null

@onready var _panel: Panel = get_tree().get_first_node_in_group("ShopPanel")
@onready var _hover: AudioStreamPlayer = $HoverSFX
@onready var _click: AudioStreamPlayer = $ClickSFX

signal upgrade_purchased(item)

func _ready() -> void:
	connect("upgrade_purchased", Callable(_panel, "handle_purchase"))
	
	$NameLabel.text = UpgradeDatabase.SHOP[item]["displayname"]
	$ItemIcon.texture = load(UpgradeDatabase.SHOP[item]["icon"])
	update_values()

func update_values() -> void:
	var current_level = SaveManager.meta_upgrades[item]["level"]
	$LevelLabel.text = str(current_level, "/", UpgradeDatabase.SHOP[item]["max_level"])
	$PriceLabel.text = str(UpgradeDatabase.SHOP[item]["price"][current_level],"E")

func _on_focus_entered() -> void:
	_hover.play()

func _on_pressed() -> void:
	_click.play()
	emit_signal("upgrade_purchased", item)

extends Button

var item = null

@onready var player = get_tree().get_first_node_in_group("Player")

signal selected_upgrade(upgrade)

func _ready() -> void:
	connect("selected_upgrade", Callable(player, "upgrade_character"))

func _on_pressed() -> void:
	emit_signal("selected_upgrade", item)

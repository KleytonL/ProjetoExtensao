extends ScrollContainer

@onready var text_node: RichTextLabel = $RichTextLabel
@export var delay_final : float = 2.0
@export var velocity : float = 30.0

@onready var logo = $"../TextureRect"

func _ready() -> void:
	await get_tree().process_frame
	logo_visibility()
	start_credit()

func logo_visibility() -> void:
	var tween = create_tween()
	tween.tween_property(logo, "modulate:a", 0.25, 1.0)

func start_credit() -> void:
	var height_text = text_node.get_content_height()
	var height_container = size.y
	
	text_node.position.y = height_container
	
	var destiny_final = -height_text
	
	var distance_total = height_text + height_container
	var duration = distance_total / velocity
	
	var tween = create_tween()
	tween.tween_property(text_node, "position:y", destiny_final, duration)\
		.set_trans(tween.TRANS_LINEAR)\
		.set_ease(tween.EASE_IN_OUT)
	
	tween.tween_interval(delay_final)
	tween.tween_callback(start_credit)

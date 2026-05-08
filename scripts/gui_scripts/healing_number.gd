extends Node2D
class_name HealingNumber

@onready var _label: Label = $Heal

const COLOR: Color = Color("ecf40b")

func setup(amount: int) -> void:
	_label.text = str(int(amount)) if fmod(amount, 1.0) == 0.0 else str(amount)
	_label.add_theme_color_override("font_color", COLOR)
	
	_label.add_theme_constant_override("outline_size", 2)
	_label.add_theme_color_override("font_outline_color", "201533")
	
	_label.add_theme_font_size_override("font_size",6)
	
	_set_popup()

func _set_popup() -> void:
	var duration: float = 0.5
	
	var tween: Tween = create_tween()
	tween.tween_property(_label, "scale", Vector2(1.0, 1.0), 0.35).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	await get_tree().create_timer(duration).timeout
	queue_free()

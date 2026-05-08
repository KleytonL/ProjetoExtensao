extends Node2D
class_name DamageNumber

@onready var _label: Label = $Damage

const COLOR: Color = Color("fff")
const CRIT: Color = Color("0ce6f2")

func setup(amount: float, is_crit: bool = false) -> void:
	_label.text = str(int(amount)) if fmod(amount, 1.0) == 0.0 else str(amount)
	_label.add_theme_color_override("font_color", CRIT if is_crit else COLOR)
	
	if is_crit:
		_label.text += "!"
	
	_label.add_theme_constant_override("outline_size", 2)
	_label.add_theme_color_override("font_outline_color", "201533")
	
	_label.add_theme_font_size_override("font_size", 8 if is_crit else 6)
	
	_set_popup(is_crit)

func _set_popup(is_crit: bool) -> void:
	var duration: float = 0.7 if is_crit else 0.5
	
	var tween: Tween = create_tween()
	tween.tween_property(_label, "scale", Vector2(1.0, 1.0), 0.35).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	await get_tree().create_timer(duration).timeout
	queue_free()

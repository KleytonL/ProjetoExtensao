extends AttackState
class_name AttackStateThree

func process_physics(_delta: float) -> State:
	var time = parent.animations.current_animation_position
	if time > 0.25:
		parent.velocity = Vector2(move_speed*1.35, 0) if parent.sprite.scale.x == 1 else Vector2(-move_speed*1.35, 0)
		input_window = true
	
	if not parent.animations.is_playing():
		parent.velocity = Vector2.ZERO
		if Input.get_axis("ui_left", "ui_right") or Input.get_axis("ui_up", "ui_down"):
			return move_state
		return idle_state
	
	parent.move_and_slide()
	return null

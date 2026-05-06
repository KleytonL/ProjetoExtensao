extends AttackState
class_name AttackStateTwo

func process_physics(_delta: float) -> State:
	var time = parent.animations.current_animation_position
	if time > 0.2:
		parent.velocity = attack_direction * ATTACK_LEAP * 1.35
		input_window = true
	
	if not parent.animations.is_playing():
		parent.velocity = Vector2.ZERO
		if attack_buffer and input_window and next_attack:
			return next_attack
		if Input.get_axis("ui_left", "ui_right") or Input.get_axis("ui_up", "ui_down"):
			return move_state
		return idle_state
	
	parent.move_and_slide()
	return null

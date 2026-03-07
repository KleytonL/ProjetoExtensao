extends AttackState
class_name AttackStateOne

func process_physics(_delta: float) -> State:
	var time = parent.animations.current_animation_position
	
	if time > 0.2:
		combo_window = true
	
	if not parent.animations.is_playing():
		if attack_buffer and combo_window and next_attack:
			return next_attack
		
		return idle_state
	
	return null

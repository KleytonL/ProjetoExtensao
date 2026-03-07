extends AttackState
class_name AttackStateThree

func enter() -> void:
	super()
	hitbox_component.damage += 1

func process_physics(_delta: float) -> State:
	if not parent.animations.is_playing():
		hitbox_component.damage -= 1
		return idle_state
	
	return null

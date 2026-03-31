extends Timer

@export var state_machine: StateMachine
@export var attack_state: EnemyAttackState
@export var attack_range_component: EnemyAttackRangeComponent

func _on_timeout() -> void:
	if attack_range_component.in_range:
		state_machine.change_state(attack_state)

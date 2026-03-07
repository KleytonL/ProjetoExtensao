extends Node
class_name StateMachine

@export var initial_state: State
var current_state: State

func init(parent: CharacterBody2D) -> void:
	for child in get_children():
		if child is State:
			child.parent = parent
			child.state_machine = self
	if initial_state:
		initial_state.enter()
		current_state = initial_state

func process_input(event: InputEvent) -> void:
	var new_state = current_state.process_input(event)
	if new_state:
		change_state(new_state)

func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)

func process_physics(delta: float) -> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)

func change_state(new_state) -> void:
	if new_state == current_state:
		return
	
	if current_state:
		current_state.exit()
	
	current_state = new_state
	current_state.enter()

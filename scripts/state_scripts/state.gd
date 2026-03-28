extends Node
class_name State

@export var animation_name: String
@export var move_speed: int = 25

var parent: CharacterBody2D
var state_machine: StateMachine

func enter() -> void:
	parent.animations.play(animation_name)

func exit() -> void:
	pass

func process_input(_event: InputEvent) -> State:
	return null

func process_frame(_delta: float) -> State:
	return null

func process_physics(_delta: float) -> State:
	return null

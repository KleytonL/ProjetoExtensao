extends Area2D
class_name AttackRangeComponent

var _in_range: Array = []
@export var range_radius: float
@onready var _collision: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	_collision.shape.radius = range_radius

func _on_body_entered(body: Node2D) -> void:
	if not _in_range.has(body):
		_in_range.append(body)

func _on_body_exited(body: Node2D) -> void:
	if not _in_range.has(body):
		_in_range.erase(body)

func get_random_target():
	if _in_range.size() > 0:
		return _in_range.pick_random().global_position
	else:
		return Vector2.ZERO

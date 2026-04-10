extends Area2D
class_name EnemyAttackRangeComponent

var in_range: bool = false
@export var _range_radius: float
@onready var _collision: CollisionShape2D = $CollisionShape2D
@onready var _player: Player = get_tree().get_first_node_in_group("Player")

func _ready() -> void:
	_collision.shape.radius = _range_radius

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		in_range = true

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		in_range = false

func get_player_position() -> Vector2:
	if in_range:
		return _player.global_position
	return Vector2.ZERO

func get_player() -> Player:
	if in_range:
		return _player
	return null

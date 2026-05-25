extends Area2D
class_name AttackRangeComponent

var _in_range: Array = []
@export var range_radius: float
@onready var _collision: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	_collision.shape.radius = range_radius

func _on_area_entered(area: Area2D) -> void:
	if area is EnemyHurtboxComponent:
		var enemy = area.owner
		if not _in_range.has(enemy):
			_in_range.append(enemy)

func _on_area_exited(area: Area2D) -> void:
	if area is EnemyHurtboxComponent:
		var enemy = area.owner
		if _in_range.has(enemy):
			_in_range.erase(enemy)

func get_random_target() -> Vector2:
	_in_range = _in_range.filter(func(e): return is_instance_valid(e))
	if _in_range.size() > 0:
		return _in_range.pick_random().global_position
	else:
		return Vector2.ZERO

func get_random_position() -> Vector2:
	var screen_size: Vector2 = get_viewport().get_visible_rect().size / 2
	var screen_center: Vector2 = get_viewport().get_camera_2d().get_screen_center_position()
	var random_pos: Vector2 = Vector2(randf_range(-screen_size.x, screen_size.x), randf_range(-screen_size.y, screen_size.y)) * 0.6
	return screen_center + random_pos

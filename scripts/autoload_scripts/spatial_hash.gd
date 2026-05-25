extends Node

const cell_size: int = 32
var _grid: Dictionary = {}

func _process(_delta: float) -> void:
	_grid.clear()
	for enemy in get_tree().get_nodes_in_group("Enemy"):
		var cell = _to_cell(enemy.global_position)
		if not _grid.has(cell):
			_grid[cell] = []
		_grid[cell].append(enemy)

func _to_cell(pos: Vector2) -> Vector2i:
	return Vector2i(int(pos.x / cell_size), int (pos.y / cell_size))

func get_neighbors(pos: Vector2) -> Array:
	var cell = _to_cell(pos)
	var result: Array = []
	for dx in [-1, 0, 1]:
		for dy in [-1, 0, 1]:
			var neighbor_cell = Vector2i(cell.x + dx, cell.y + dy)
			if _grid.has(neighbor_cell):
				result.append_array(_grid[neighbor_cell])
	return result

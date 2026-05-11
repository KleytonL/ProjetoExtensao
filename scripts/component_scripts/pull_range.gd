extends Area2D

@export var stats_component: StatsComponent

func _ready() -> void:
	stats_component.update_stats.connect(update_area_size)
	print(self.scale)
	update_area_size()

func update_area_size() -> void:
	self.scale = Vector2.ONE * stats_component.bonus_collect_area_size
	print(self.scale)
	print(stats_component.bonus_collect_area_size)

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("collectables"):
		area.target = owner

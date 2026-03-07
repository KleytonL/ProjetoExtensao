extends ProgressBar
class_name HealthBar

@export var health_component: HealthComponent

func _ready() -> void:
	set_healthbar()

func set_healthbar() -> void:
	self.value = health_component.health
	self.max_value = health_component.max_health

func _on_health_component_update_healthbar() -> void:
	set_healthbar()

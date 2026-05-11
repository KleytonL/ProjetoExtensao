extends Area2D

@export var experience: ExperienceComponent
@export var health_component: HealthComponent

func _on_area_entered(area: Area2D) -> void:
	if area is Experience:
		experience.calculate_exp(area.collect())
	if area is Essence:
		GameLogic.holding_essences += area.collect()
	if area is MagneticGem:
		area.collect()
	if area is Beef:
		health_component.update_health(area.collect())

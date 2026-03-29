extends TextureProgressBar

@export var experience_component: ExperienceComponent

func _ready() -> void:
	set_experiencebar()

func set_experiencebar() -> void:
	self.value = experience_component.experience
	self.max_value = experience_component.exp_capacity()
	$Label.text = str("Level: ", experience_component.level)

func _on_experience_component_update_experiencebar() -> void:
	set_experiencebar()

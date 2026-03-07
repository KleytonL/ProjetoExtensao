extends Node
class_name FrameFreezeComponent

func activate(timeScale: float, duration: float):
	Engine.time_scale = timeScale
	await get_tree().create_timer(duration * timeScale).timeout
	Engine.time_scale = 1.0

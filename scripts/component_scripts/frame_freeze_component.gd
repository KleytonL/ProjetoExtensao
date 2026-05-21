extends Node
class_name FrameFreezeComponent

signal freeze_finished

func activate(timeScale: float, duration: float) -> void:
	Engine.time_scale = timeScale
	await get_tree().create_timer(duration * timeScale).timeout
	Engine.time_scale = 1.0

func fade_in_freeze(timeScale: float, duration: float) -> void:
	var tween = create_tween()
	tween.tween_property(Engine, "time_scale", timeScale, duration).set_trans(Tween.TRANS_SINE)
	tween.set_ignore_time_scale(true)
	tween.play()
	await tween.finished
	emit_signal("freeze_finished")
	Engine.time_scale = 1.0

func fade_out_freeze(timeScale: float, duration: float) -> void:
	Engine.time_scale = timeScale
	var tween = create_tween()
	tween.tween_property(Engine, "time_scale", 1.0, duration)
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ignore_time_scale(true)
	tween.play()
	await tween.finished
	emit_signal("freeze_finished")

func on_death_freeze(timeScale: float, duration: float) -> void:
	var tween = create_tween()
	tween.tween_property(Engine, "time_scale", timeScale, duration).set_trans(Tween.TRANS_SINE)
	tween.set_ignore_time_scale(true).set_parallel(true)
	tween.tween_property(AudioServer, "playback_speed_scale", 0.1, duration*3).set_trans(Tween.TRANS_SINE)
	tween.play()
	await tween.finished
	$"../../BGM".playing = false
	emit_signal("freeze_finished")
	Engine.time_scale = 1.0
	AudioServer.playback_speed_scale = 1.0

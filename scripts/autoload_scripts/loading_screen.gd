extends CanvasLayer

func change_scene(scene: String) -> void:
	$AnimationPlayer.play("transition")
	await  $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(scene)
	$AnimationPlayer.play_backwards("transition")

func reload() -> void:
	$AnimationPlayer.play("transition")
	await  $AnimationPlayer.animation_finished
	get_tree().reload_current_scene()
	$AnimationPlayer.play_backwards("transition")

func exit_game() -> void:
	$AnimationPlayer.play("transition")
	await  $AnimationPlayer.animation_finished
	if OS.has_feature("web"):
		JavaScriptBridge.eval("window.close()")
	else:
		get_tree().quit()

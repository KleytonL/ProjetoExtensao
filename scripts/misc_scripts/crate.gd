extends EnemyHurtboxComponent
class_name Crate

@onready var _beef = preload("res://scenes/misc/beef.tscn")
@onready var _magnet = preload("res://scenes/misc/magnetic_gem.tscn")

func damage(attack: PlayerHitboxComponent) -> void:
	super(attack)
	$AnimationPlayer.play("shake_animation")

func destroy() -> void:
	set_deferred("monitorable", false)
	$Sprite2D.visible = false
	$CPUParticles2D.restart()
	var new_beef = _beef.instantiate()
	var new_magnet = _magnet.instantiate()
	new_beef.position = global_position
	new_magnet.position = global_position
	get_parent().current_crates -= 1
	get_parent().call_deferred("add_child", new_beef)
	get_parent().call_deferred("add_child", new_magnet)
	await $CPUParticles2D.finished
	queue_free()

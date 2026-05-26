extends EnemyHurtboxComponent
class_name Crate

@onready var _beef = preload("res://scenes/misc/beef.tscn")
@onready var _magnet = preload("res://scenes/misc/magnetic_gem.tscn")
@onready var _essence = preload("res://scenes/misc/essence.tscn")

var min_essence: int = 1
var max_essence: int = 5
var magnet_chance: float = 0.25
var can_break: bool = true

func damage(attack: PlayerHitboxComponent) -> void:
	if !can_break:
		return
	super(attack)
	$AnimationPlayer.play("shake_animation")

func destroy() -> void:
	can_break = false
	set_deferred("monitorable", false)
	$Sprite2D.visible = false
	$CPUParticles2D.restart()
	get_parent().current_crates -= 1
	
	spawn_item(_beef)
	
	var amount: int = randi_range(min_essence, max_essence)
	for i in amount:
		spawn_item(_essence)
	
	if randf() < magnet_chance:
		spawn_item(_magnet)
	
	await $CPUParticles2D.finished
	queue_free()

func spawn_item(item: PackedScene) -> void:
	var new_item = item.instantiate()
	new_item.global_position = global_position
	get_parent().call_deferred("add_child", new_item)
	
	var angle = randf_range(0, TAU)
	var distance = randf_range(8.0, 16.0)
	var destination = global_position + Vector2(cos(angle), sin(angle)) * distance
	
	var tween = new_item.create_tween()
	tween.tween_property(new_item, "global_position", destination, 0.25).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	

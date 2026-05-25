extends PlayerHitboxComponent
class_name MarbleProjectile

var health: int
var projectile_speed: int
var projectile_size: float
var knockback: int

var projectile_angle: Vector2 = Vector2.ZERO
var projectile_target: Vector2 = Vector2.ZERO

var bounces_left: int
var damage_multiplier: float = 1.25
var hit_enemies: Array = []

func _ready() -> void:
	super()
	bounces_left = health
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(0.3, 0.3) * projectile_size, 0.75).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	tween.play()
	projectile_angle = global_position.direction_to(projectile_target)

func _physics_process(delta: float) -> void:
	position += projectile_angle * projectile_speed * delta

func _on_area_entered(area: Area2D) -> void:
	super(area)
	if area is EnemyHurtboxComponent:
		var enemy = area.owner
		if enemy in hit_enemies:
			return
		hit_enemies.append(enemy)
		if health <= 0:
			queue_free()
		health -= 1
		_base_damage *= damage_multiplier
		bounce(enemy)

func bounce(last_target: CharacterBody2D) -> void:
	var best_target: CharacterBody2D = null
	var best_distance: float = INF
	
	for area in get_tree().get_nodes_in_group("Enemy"):
		if area == last_target or area in hit_enemies:
			continue
		var dist = global_position.distance_to(area.global_position)
		if dist < best_distance:
			best_distance = dist
			best_target = area
	if best_target == null:
		queue_free()
		return
	projectile_angle = global_position.direction_to(best_target.global_position)


func _on_duration_timer_timeout() -> void:
	queue_free()

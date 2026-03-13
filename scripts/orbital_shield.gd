extends Node2D
class_name OrbitalShield

@export var orbit_radius: float  = 25.0
@export var rotation_speed: float = 1.75
@export var damage: int          = 2
@export var knockback_force: int = 60
@export var recharge_time: float = 3.0


var _orb_count: int   = 0
var _angle: float     = 0.0
var _orbs: Array      = []
var _active: bool     = false
var _orb_texture = preload("res://icons/shield2.png")

func _ready() -> void:
	set_process(false)

func _process(delta: float) -> void:
	if not _active:
		return
	_angle += rotation_speed * delta
	_reposition_orbs()

func activate() -> void:
	_active = true
	set_process(true)
	set_orb_count(1)

func set_orb_count(count: int) -> void:
	while _orbs.size() > count:
		var orb = _orbs.pop_back()
		if is_instance_valid(orb):
			orb.queue_free()
	while _orbs.size() < count:
		_spawn_orb()
	_orb_count = count
	_reposition_orbs()

func set_damage(new_damage: int) -> void:
	damage = new_damage
	for orb in _orbs:
		if is_instance_valid(orb):
			orb.set_meta("damage", damage)

func set_recharge_time(new_time: float) -> void:
	recharge_time = new_time

func _reposition_orbs() -> void:
	var count = _orbs.size()
	if count == 0:
		return
	for i in count:
		var orb = _orbs[i]
		if not is_instance_valid(orb):
			continue
		var offset = (TAU / count) * i
		orb.position = Vector2(orbit_radius, 0).rotated(_angle + offset)

func _spawn_orb() -> void:
	var orb = Area2D.new()
	orb.name = "OrbitalOrb"
	orb.collision_layer = 1
	orb.collision_mask  = 2

	var shape = CollisionShape2D.new()
	var circle = CircleShape2D.new()
	circle.radius = 5.0
	shape.shape = circle
	orb.add_child(shape)

	var sprite = Sprite2D.new()
	sprite.texture = _orb_texture
	sprite.scale = Vector2(0.09, 0.09)
	orb.add_child(sprite)

	orb.set_meta("damage", damage)
	orb.set_meta("knockback_force", knockback_force)
	orb.set_meta("hit_set", [])
	orb.area_entered.connect(_on_orb_area_entered.bind(orb))

	add_child(orb)
	_orbs.append(orb)
	
func _on_orb_area_entered(area: Area2D, orb: Area2D) -> void:
	if not (area is EnemyHurtboxComponent):
		return
		
	var hit_set: Array = orb.get_meta("hit_set")
	var enemy_node = area.get_parent()
	if hit_set.has(enemy_node):
		return
		
	hit_set.append(enemy_node)
	orb.set_meta("hit_set", hit_set)
	
	var orb_damage = orb.get_meta("damage")
	var dir = (area.global_position - orb.global_position).normalized()
	var fake_hit = OrbHit.new()
	
	fake_hit.damage = orb_damage
	fake_hit.direction = dir
	area.damage(fake_hit)
	
	var orb_ref = weakref(orb)
	get_tree().create_timer(1.0).timeout.connect(func():
		var o = orb_ref.get_ref()
		if o:
			var hs: Array = o.get_meta("hit_set")
			hs.erase(enemy_node)
			o.set_meta("hit_set", hs)
	)
	
func on_orb_destroyed(orb: Area2D) -> void:
	var idx = _orbs.find(orb)
	if idx != -1:
		_orbs.remove_at(idx)
	get_tree().create_timer(recharge_time).timeout.connect(_recharge_orb)

func _recharge_orb() -> void:
	if not _active:
		return
	_spawn_orb()
	_orb_count = _orbs.size()
	_reposition_orbs()

class OrbHit extends PlayerHitboxComponent:
	pass

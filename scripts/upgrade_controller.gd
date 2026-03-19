extends Node
class_name UpgradeController

@export var player: Player

var _upgrades: Dictionary = {
	"soulfire": preload("res://scenes/character/weapon_soulfire.tscn"),
	"shield": preload("res://scenes/character/weapon_orbital_shield.tscn")
}

var _active: Dictionary = {}

func handle_upgrade(item: String) -> void:
	var data = UpgradeDatabase.UPGRADES[item]

	if data["type"] == "weapon":
		var key = data["key"]
		print(key)
		if key in _active:
			print(_active[key].current_level)
			_active[key].current_level += 1
			print(_active[key].current_level)
		else:
			var instance = _upgrades[key].instantiate()
			print(_upgrades[key])
			print(instance)
			player.call_deferred("add_child", instance)
			_active[key] = instance
			print(_active[key])
#	elif data["type"] == "item":
#		var key = data[]
#		print(item, type)
#		"soulfire2":
#			soulfire_level += 1
#			soulfire_amount += 1
#		"soulfire3":
#			soulfire_level += 1
#		"soulfire4":
#			soulfire_level += 1
#			soulfire_amount += 1
#		"soulfire5":
#			soulfire_level += 1
#			soulfire_atkspeed -= 1
#		"soulfire6":
#			soulfire_level += 1
#			soulfire_amount += 2
#		"shield1":
#			shield_level = 1
			#orbital_shield.activate()
#		"shield2":
#			shield_level = 2
#			shield_damage = 2
			#orbital_shield.set_orb_count(2)
			#orbital_shield.set_damage(shield_damage)
#		"shield3":
#			shield_level = 3
#			shield_damage = 4
			#orbital_shield.set_damage(shield_damage)
			#orbital_shield.set_recharge_time(2.0)
#		"shield4":
#			shield_level = 4
#			shield_orb_count = 3
			#orbital_shield.set_orb_count(3)
#		"shield5":
#			shield_level = 5
#			shield_orb_count = 4
			#orbital_shield.set_orb_count(4)
#		"shield6":
#			shield_level = 6
#			shield_damage = 5
			#orbital_shield.set_damage(shield_damage)
			#orbital_shield.set_recharge_time(1.5)
			#orbital_shield.rotation_speed = 2.5
#		"food":
#			health += 5
#			health = clamp(health, 0, max_health)

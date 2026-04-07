extends Node

const PATH: String = "user://user_preferences.cfg"

var sfx_enabled: bool = true
var bgm_enabled: bool = true
var sfx_volume: float = 1.0
var bgm_volume: float = 1.0
var input_map: Dictionary = {}

func _ready() -> void:
	load_config()
	apply_audio()

func load_config() -> void:
	var config = ConfigFile.new()
	var err = config.load(PATH)
	if err != OK:
		return
	
	config.get_value("audio", "sfx_enabled", true)
	config.get_value("audio", "bgm_enabled", true)
	config.get_value("audio", "sfx_volume", 1.0)
	config.get_value("audio", "bgm_volume", 1.0)
	config.get_value("input", "input_map", {})

func save_config() -> void:
	var config = ConfigFile.new()
	
	config.set_value("audio", "sfx_enabled", sfx_enabled)
	config.set_value("audio", "bgm_enabled", bgm_enabled)
	config.set_value("audio", "sfx_volume", sfx_volume)
	config.set_value("audio", "bgm_volume", bgm_volume)
	config.set_value("input", "input_map", input_map)
	
	config.save(PATH)

func apply_audio() -> void:
	AudioServer.set_bus_volume_db(
		AudioServer.get_bus_index("SoundEffects"),
		linear_to_db(sfx_volume)
	)
	AudioServer.set_bus_volume_db(
		AudioServer.get_bus_index("BackgroundMusic"),
		linear_to_db(bgm_volume)
	)
	AudioServer.set_bus_mute(
		AudioServer.get_bus_index("SoundEffects"),
		!sfx_enabled
	)
	AudioServer.set_bus_mute(
		AudioServer.get_bus_index("BackgroundMusic"),
		!bgm_enabled
	)

func apply_input() -> void:
	pass

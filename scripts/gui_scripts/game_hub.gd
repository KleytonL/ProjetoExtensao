extends Control
class_name GameHub

@onready var _hover: AudioStreamPlayer = $HoverSFX
@onready var _click: AudioStreamPlayer = $ClickSFX

func _ready() -> void:
	Engine.time_scale = 1.0

	if !MenuMusic.playing:
		MenuMusic.play()
	
	if UserConfig.is_mobile:
		for b in self.get_children():
			if b is TextureButton:
				b.mouse_filter = MOUSE_FILTER_STOP
		return
	
	$level_btn.grab_focus()

func _on_level_btn_focus_entered() -> void:
	_hover.play()
	on_focus_tween($level_btn)
	$LevelSelectionPanel.on_focus()
	$MetaShopPanel.out_of_focus()

func _on_level_btn_focus_exited() -> void:
	unfocus_tween($level_btn)

func _on_shop_btn_focus_entered() -> void:
	_hover.play()
	on_focus_tween($shop_btn)
	$MetaShopPanel.on_focus()
	$LevelSelectionPanel.out_of_focus()

func _on_shop_btn_focus_exited() -> void:
	unfocus_tween($shop_btn)


func _on_voltar_btn_focus_entered() -> void:
	_hover.play()

func _on_voltar_btn_pressed() -> void:
	_click.play()
	LoadingScreen.change_scene("res://scenes/menus/main_menu.tscn")

func on_focus_tween(button: TextureButton) -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(button, "position", Vector2(0, button.position.y), 0.25)
	tween.set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	tween.play()

func unfocus_tween(button: TextureButton) -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(button, "position", Vector2(-8, button.position.y), 0.25)
	tween.set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	tween.play()

extends ScrollContainer

@onready var text_node: RichTextLabel = $RichTextLabel
@export var delay_no_final : float = 2.0
@export var velocidade : float = 30.0

@onready var logo = $"../TextureRect"

func _ready() -> void:
	
	print(logo)
	await get_tree().process_frame
	await get_tree().process_frame
	
	iniciar_creditos()


func iniciar_creditos() -> void:
	var altura_texto = text_node.get_content_height()
	var altura_container = size.y
	
	text_node.position.y = altura_container
	
	var destino_final = -altura_texto
	
	var distancia_total = altura_texto + altura_container
	var duracao = distancia_total / velocidade
	
	var tween = create_tween()
	tween.tween_property(text_node, "position:y", destino_final, duracao)\
		.set_trans(tween.TRANS_LINEAR)\
		.set_ease(tween.EASE_IN_OUT)
	
	tween.tween_interval(delay_no_final)
	tween.tween_callback(iniciar_creditos)

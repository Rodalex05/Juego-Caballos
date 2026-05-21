extends Area2D
@export var ganaste: PackedScene
func _ready() -> void:
	#Señal que detecta una colison
	body_entered.connect(_on_body_entered)

#Funcion cuando un jugador toque la meta
func _on_body_entered(body: Node2D) -> void:
	#Esperar 5 segundos despues de tocar la meta
	await get_tree().create_timer(5).timeout
	#Ir al menu de ganador
	get_tree().change_scene_to_packed(ganaste)
	

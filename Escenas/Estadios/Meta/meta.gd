extends Area2D
@export var victoria: AudioStreamPlayer
@export var ganaste: PackedScene
signal final
func _ready() -> void:
	#Señal que detecta una colison
	body_entered.connect(_on_body_entered)

#Funcion cuando un jugador toque la meta
func _on_body_entered(body: Node2D) -> void:
	await get_tree().create_timer(2).timeout
	final.emit()
	Engine.time_scale = 1
	$"../../Confetti"._Confetti()
	$"../../Confetti2"._Confetti()
	$"../../Confetti3"._Confetti()
	$"../../Confetti4"._Confetti()
	$"../../Confetti5"._Confetti()
	victoria.play()
	#Esperar 2 segundos despues de tocar la meta
	await get_tree().create_timer(5).timeout
	#Ir al menu de ganador
	get_tree().change_scene_to_packed(ganaste)
	

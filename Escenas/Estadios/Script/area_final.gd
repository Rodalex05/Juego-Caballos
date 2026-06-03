extends Area2D
@export var drums: AudioStreamPlayer
signal acercamiento
signal acercamiento2
func _ready() -> void:
	#Señal que detecta una colison
	body_entered.connect(_on_body_entered)

#Funcion cuando un jugador toque la meta
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Jugador1":
		print("Entró J1")
		emit_signal("acercamiento")
		drums.play()
		Nombres.nombre_ganador=Nombres.nombrej1
		SkinsGlobal.skin_1lugar =1
	elif body.name == "Jugador2":
		print("Entró J2")
		emit_signal("acercamiento2")
		drums.play()
		Nombres.nombre_ganador=Nombres.nombrej2
		SkinsGlobal.skin_1lugar =2

	
	
 

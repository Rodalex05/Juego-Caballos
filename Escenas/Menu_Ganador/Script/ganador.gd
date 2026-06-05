extends Control

var fondos_ganador = [
	preload("res://sprites/Ganador/Ganador_fondo.png"),
	preload("res://sprites/Ganador/Ganador_fondo2.png"),
	preload("res://sprites/Ganador/Ganador_fondo3.png")
]
func _ready() -> void:
	cambiar_fondo()

func cambiar_fondo() -> void:
	if Fondos.Fondo_jugar == 0:
		$TextureRect.texture = fondos_ganador[0]
	elif Fondos.Fondo_jugar == 1:
		$TextureRect.texture = fondos_ganador[1]
	elif Fondos.Fondo_jugar == 2:
		$TextureRect.texture = fondos_ganador[2]

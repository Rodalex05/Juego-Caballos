extends AudioStreamPlayer
var cancion=""

func _ready() -> void:
	if Fondos.Fondo_jugar == 0:
		stream = load("res://Musica/Zacatecas.mp3")
		print("Zacatecas")
	elif Fondos.Fondo_jugar == 1:
		stream = load("res://Musica/Durango.mp3")
		print("Durango")
	if Fondos.Fondo_jugar == 2:
		stream = load("res://Musica/Cohauila.mp3")
		print("Coahuila")

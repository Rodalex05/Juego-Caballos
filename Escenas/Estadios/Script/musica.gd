extends AudioStreamPlayer
var cancion=""
#Reproduce una cancion dependiendo del escenario
func _ready() -> void:
	if Fondos.Fondo_jugar == 0:
		stream = load("res://Musica/Zacatecas.mp3")
	elif Fondos.Fondo_jugar == 1:
		stream = load("res://Musica/Durango.mp3")
	if Fondos.Fondo_jugar == 2:
		stream = load("res://Musica/Cohauila.mp3")

extends AudioStreamPlayer2D

func _ready():
	if PrimeraVez.musica_intro_sonada == false:
		self.play()
		PrimeraVez.musica_intro_sonada = true

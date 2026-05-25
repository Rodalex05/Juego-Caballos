extends AudioStreamPlayer2D

func _ready():
	if SkinsGlobal.musica_intro_sonada == false:
		self.play()
		SkinsGlobal.musica_intro_sonada = true
		print(SkinsGlobal.musica_intro_sonada)

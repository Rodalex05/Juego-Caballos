extends Label
#Imprime al ganador
func _ready() -> void:
	text=("El Ganador es:\n " + Nombres.nombre_ganador)
	if SkinsGlobal.skin_1lugar==1:
		#Asigna la skin del j1
		$"../JugadorGanador".sprite_frames = SkinsGlobal.skins_animadas[SkinsGlobal.skin_j1]
		#Ponle el estado "idle"
		$"../JugadorGanador".play("idle") 
		#Detiene la animacion para que se quede estatico
		$"../JugadorGanador".stop()
		#Asigna la skin del j2
		$"../JugadorPerdedor".sprite_frames = SkinsGlobal.skins_animadas[SkinsGlobal.skin_j2]
		#Ponle el estado "idle"
		$"../JugadorPerdedor".play("idle")
		#Detiene la animacion para que se quede estatico
		$"../JugadorPerdedor".stop()
	if SkinsGlobal.skin_1lugar==2:
		#Asigna la skin del j2
		$"../JugadorGanador".sprite_frames = SkinsGlobal.skins_animadas[SkinsGlobal.skin_j2]
		#Ponle el estado "idle"
		$"../JugadorGanador".play("idle") 
		#Detiene la animacion para que se quede estatico
		$"../JugadorGanador".stop()
		#Asigna la skin del j1
		$"../JugadorPerdedor".sprite_frames = SkinsGlobal.skins_animadas[SkinsGlobal.skin_j1]
		#Ponle el estado "idle"
		$"../JugadorPerdedor".play("idle")
		#Detiene la animacion para que se quede estatico
		$"../JugadorPerdedor".stop()

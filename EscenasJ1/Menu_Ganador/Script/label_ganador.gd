extends Label
func _ready() -> void:
	$"../JugadorGanador".sprite_frames = SkinsGlobal.skins_animadas[SkinsGlobal.skin_j1]
#	Ponle el estado "idle"
	$"../JugadorGanador".play("idle") 
	#Detiene la animacion para que se quede estatico
	$"../JugadorGanador".stop()

extends Label
#Imprime al ganador
func _ready() -> void:
	$".".text=("El Ganador es:\n " + Nombres.nombre_ganador)
	if SkinsGlobal.skin_1lugar==1:
		$"../JugadorGanador".sprite_frames = SkinsGlobal.skins_animadas[SkinsGlobal.skin_j1]
		$"../JugadorGanador".play("idle") # o la animación que quieras
		$"../JugadorGanador".stop()
		$"../JugadorPerdedor".sprite_frames = SkinsGlobal.skins_animadas[SkinsGlobal.skin_j2]
		$"../JugadorPerdedor".play("idle") # o la animación que quieras
		$"../JugadorPerdedor".stop()
	if SkinsGlobal.skin_1lugar==2:
		$"../JugadorGanador".sprite_frames = SkinsGlobal.skins_animadas[SkinsGlobal.skin_j2]
		$"../JugadorGanador".play("idle") # o la animación que quieras
		$"../JugadorGanador".stop()
		$"../JugadorPerdedor".sprite_frames = SkinsGlobal.skins_animadas[SkinsGlobal.skin_j1]
		$"../JugadorPerdedor".play("idle") # o la animación que quieras
		$"../JugadorPerdedor".stop()

extends Parallax2D
@onready var sprite_fondo = $Fondo

func cambiar_fondo(indice):
	if indice >= 0 and indice < Fondos.fondos.size():
		sprite_fondo.texture = Fondos.fondos[indice]

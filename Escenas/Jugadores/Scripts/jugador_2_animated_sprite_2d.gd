extends AnimatedSprite2D
# FUNCION READY
func _ready():
#Aplica la skin seleccionada
	sprite_frames = SkinsGlobal.skins_animadas[SkinsGlobal.skin_j2]

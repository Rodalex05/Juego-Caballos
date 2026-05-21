extends AnimatedSprite2D
# ==========================================
#SKINS ANIMADAS
# ==========================================
#Carga las skins animadas
var skins_animadas = [

	preload("res://Escenas/Jugadores/sf_skin1.tres"),
	preload("res://Escenas/Jugadores/sf_skin2.tres"),

]

# ==========================================
# FUNCION READY
# ==========================================
func _ready():
#Aplica la skin seleccionada
	sprite_frames = skins_animadas[SkinsGlobal.skin_j2]

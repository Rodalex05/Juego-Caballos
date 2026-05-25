extends Control

var tiempo := 0.0
@export var velocidadtm= 0.1
var color_dia = Color.WHITE
var color_atardecer = Color(1.0, 0.75, 0.45)
var color_noche = Color(0.15, 0.15, 0.35)

func cambiar_color(color):
	$Parallax2D/Sprite2D.modulate = color
	$Parallax2D2/Sprite2D.modulate = color

func _process(delta):
	tiempo += delta * velocidadtm
	# Día → atardecer
	if tiempo < 1.0:
		var t = tiempo
		cambiar_color(color_dia.lerp(color_atardecer, t))
	# Atardecer → noche
	elif tiempo < 2.0:
		var t = tiempo - 1.0
		cambiar_color(color_atardecer.lerp(color_noche, t))
	# Noche → amanecer
	elif tiempo < 3.0:
		var t = tiempo - 2.0
		cambiar_color(color_noche.lerp(color_atardecer, t))
	# Amanecer → día
	elif tiempo < 4.0:
		var t = tiempo - 3.0
		cambiar_color(color_atardecer.lerp(color_dia, t))
	else:
		tiempo = 0.0

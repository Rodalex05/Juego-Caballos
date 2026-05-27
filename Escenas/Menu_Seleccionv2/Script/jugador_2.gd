extends TextureRect

@export var presionar : AudioStreamPlayer

var bloqueado = false

# 3 columnas
var horizontal = 2

# 5 filas
var vertical = 0

var posicion_inicial := Vector2()

@onready var cursor = $Seleccion
@onready var preview_skin = $"."

var skins = [
	preload("res://sprites/Caballos/Caballo1.png"),
	preload("res://sprites/Caballos/Caballo2.png"),
	preload("res://sprites/Caballos/Caballo3.png"),
	preload("res://sprites/Caballos/Caballo4.png"),
	preload("res://sprites/Caballos/Caballo5.png"),
	preload("res://sprites/Caballos/Caballo6.png")
]


func _ready():

	posicion_inicial = cursor.position
	_actualizar_skin()
	$Label.text=(Nombres.nombrej2)



func _process(delta):

	if bloqueado:
		return

	if Input.is_action_just_pressed("Skin_J2_der"):
		mover_derecha()

	elif Input.is_action_just_pressed("Skin_J2_izq"):
		mover_izquierda()

	elif Input.is_action_just_pressed("Skin_J2_arriba"):
		mover_arriba()

	elif Input.is_action_just_pressed("Skin_J2_abajo"):
		mover_abajo()

	_actualizar_skin()



func _actualizar_skin():

	# 3 columnas
	var indice = vertical * 3 + horizontal

	if indice >= 0 and indice < skins.size():
		preview_skin.texture = skins[indice]



func mover_izquierda():

	if horizontal <= 0:
		return

	horizontal -= 1

	presionar.play()
	$Seleccion._movimientoizq()



func mover_derecha():

	# 3 columnas = indices 0,1,2
	if horizontal >= 2:
		return

	horizontal += 1

	presionar.play()
	$Seleccion._movimientoder()



func mover_arriba():

	if vertical <= 0:
		return

	vertical -= 1

	presionar.play()
	$Seleccion._movimientoarriba()



func mover_abajo():

	# 5 filas = indices 0-4
	if vertical >= 3:
		return

	vertical += 1

	presionar.play()
	$Seleccion._movimientoabajo()

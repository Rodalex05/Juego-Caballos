extends TextureRect
@export var presionar: AudioStreamPlayer
var horizontal = 0
var vertical = 0

var separacion_x = 256
var separacion_y = 256

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

	_actualizar_cursor()
	_actualizar_skin()


func _process(delta):

	if Input.is_action_just_pressed("Skin_J1_der"):
		horizontal += 1
		presionar.play()

	if Input.is_action_just_pressed("Skin_J1_izq"):
		horizontal -= 1
		presionar.play()
	if Input.is_action_just_pressed("Skin_J1_arriba"):
		vertical -= 1
		presionar.play()

	if Input.is_action_just_pressed("Skin_J1_abajo"):
		vertical += 1
		presionar.play()

	_limites()

	_actualizar_cursor()
	_actualizar_skin()

	$Label.text = "horizontal = " + str(horizontal) + \
	" vertical = " + str(vertical)



func _actualizar_cursor():

	cursor.position = posicion_inicial + Vector2(
		horizontal * separacion_x,
		vertical * separacion_y
	)



func _actualizar_skin():

	var indice = vertical * 4 + horizontal

	if indice >= 0 and indice < skins.size():
		preview_skin.texture = skins[indice]



func _limites():

	horizontal = clamp(horizontal, 0, 3)
	vertical = clamp(vertical, 0, 1)

func mover_izquierda():
	horizontal -= 1
	presionar.play()

func mover_derecha():
	horizontal += 1
	presionar.play()

func mover_arriba():
	vertical -= 1
	presionar.play()

func mover_abajo():
	vertical += 1
	presionar.play()

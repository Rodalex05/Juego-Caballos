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

#================================================
#FUNCION READY
#================================================
func _ready():
	posicion_inicial = cursor.position
	_actualizar_skin()
	$NombreJ2.text=(Nombres.nombrej2)
	
#================================================
#FUNCION PROCESS
#================================================
func _process(delta):
# CONFIRMAR
	if Input.is_action_just_pressed("Select_J2"):
		_seleccionar_skin()
		bloqueado = true
		return
# CANCELAR SELECCIÓN
	if Input.is_action_just_pressed("RegresarJ2"):
		_cancelar_seleccion()
		return

	if bloqueado:
		return
	if Input.is_action_just_pressed("Skin_J2_der"):
		if mover_derecha():
			bloqueado = true

	elif Input.is_action_just_pressed("Skin_J2_izq"):
		if mover_izquierda():
			bloqueado = true

	elif Input.is_action_just_pressed("Skin_J2_arriba"):
		if mover_arriba():
			bloqueado = true

	elif Input.is_action_just_pressed("Skin_J2_abajo"):
		if mover_abajo():
			bloqueado = true
	_actualizar_skin()

#================================================
#FUNCIONES SKINS
#================================================
func _actualizar_skin():
	# 3 columnas
	var indice = vertical * 3 + horizontal
	if indice >= 0 and indice < SkinsGlobal.skins.size():
		preview_skin.texture = SkinsGlobal.skins[indice]

func _seleccionar_skin():
	var indice = vertical * 3 + horizontal
	if indice >= 0 and indice < SkinsGlobal.skins_animadas.size():
		SkinsGlobal.skin_j2 = indice
		$Seleccion/Select._seleccionado()
		
func _cancelar_seleccion():
	# borra selección global
	Nombres.jugador1_skin = null
	$Seleccion/Select._desseleccionado()
	# desbloquea el selector
	bloqueado = false

#================================================
#CONTROLES
#================================================
func mover_izquierda():
	if horizontal <= 0:
		return false
	horizontal -= 1
	presionar.play()
	$Seleccion._movimientoizq()
	return true

func mover_derecha():
	if horizontal >= 2:
		return false
	horizontal += 1
	presionar.play()
	$Seleccion._movimientoder()
	return true

func mover_arriba():
	if vertical <= 0:
		return false
	vertical -= 1
	presionar.play()
	$Seleccion._movimientoarriba()
	return true

func mover_abajo():
	if vertical >= 3:
		return false
	vertical += 1
	presionar.play()
	$Seleccion._movimientoabajo()
	return true

extends GridContainer
#=====================VARIABLES AUDIOS========================
@export var sfx_correcto : AudioStreamPlayer
@export var sfx_incorrecto : AudioStreamPlayer

# ======CONFIGURAR BOTONES======
@onready var botones = [
	$Bt_1A,
	$Bt_1B,
	$Bt_1C,
	$Bt_1D
]
# ============ SEÑALES============
signal respuesta_correcta
signal respuesta_incorrecta

# ============VARIABLES============
var puede_responder = false
var respuesta_correcta_actual = ""
@export var cooldown : float = 5.0 

# =====================================================
# FUNCION READY
# =====================================================
func _ready():
	#Conectar botones
	for boton in botones:
		boton.pressed.connect(_on_boton_pressed.bind(boton))
		# Desactivar mouse
		boton.mouse_filter = Control.MOUSE_FILTER_IGNORE
		# Desactivar visualmente
		boton.disabled = true
# =====================================================
# RECIBIR PREGUNTA
# =====================================================
func configurar_pregunta(datos):
	#Guardar respuesta correcta
	respuesta_correcta_actual = datos["correcta"]
	#Crear opciones
	var opciones = []
	opciones.append(datos["correcta"])
	for incorrecta in datos["incorrectas"]:
		opciones.append(incorrecta)
	#Revolver respuestas
	opciones.shuffle()
	#Colocar textos
	for i in range(botones.size()):
		botones[i].text = opciones[i]
		botones[i].set_meta("correcto",opciones[i] == respuesta_correcta_actual)
	inicio_con_delay()

# =====================================================
# DELAY INICIAL
# =====================================================
func inicio_con_delay():
	puede_responder = false
	for boton in botones:
		boton.disabled = true
	await get_tree().create_timer(cooldown).timeout
	for boton in botones:
		boton.disabled = false
	puede_responder = true

# =====================================================
# INPUT TECLADO
# =====================================================
func _process(delta):

	if not puede_responder:
		return
	if Input.is_action_just_pressed("Boton1A"):
		botones[0].emit_signal("pressed")

	if Input.is_action_just_pressed("Boton1B"):
		botones[1].emit_signal("pressed")

	if Input.is_action_just_pressed("Boton1C"):
		botones[2].emit_signal("pressed")

	if Input.is_action_just_pressed("Boton1D"):
		botones[3].emit_signal("pressed")

# =====================================================
# PRESIONAR BOTÓN
# =====================================================
func _on_boton_pressed(boton):
	if not puede_responder:
		return
	puede_responder = false
	if boton.get_meta("correcto"):
		emit_signal("respuesta_correcta")
		sfx_correcto.play()
	else:
		emit_signal("respuesta_incorrecta")
		sfx_incorrecto.play()
	esperar_siguiente_pregunta()

# =====================================================
# ESPERAR SIGUIENTE PREGUNTA
# =====================================================
func esperar_siguiente_pregunta():
	for boton in botones:
		boton.disabled = true
	await get_tree().create_timer(cooldown).timeout
	$"../..".nueva_pregunta_j1()

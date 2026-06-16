extends GridContainer
#=====================VARIABLES AUDIOS========================
@export var sfx_correcto : AudioStreamPlayer
@export var sfx_incorrecto : AudioStreamPlayer

# ======CONFIGURAR BOTONES======
@onready var botones = [$Bt_1A,$Bt_1B,$Bt_1C,$Bt_1D]
# Labels hijos
@onready var botonesT = [%TextBt_1A,%TextBt_1B,%TextBt_1C,%TextBt_1D]

# ============ SEÑALES============
signal respuesta_correcta
signal respuesta_incorrecta

# ============VARIABLES============
var puede_responder = false
var respuesta_correcta_actual = ""
@export var cooldown : float = 1
var inicio=false

# =====================================================
# FUNCION READY
# =====================================================
func _ready():
	# Conectar botones
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
	# Guardar respuesta correcta
	respuesta_correcta_actual = datos["correcta"]
	# Crear opciones
	var opciones = []
	opciones.append(datos["correcta"])
	for incorrecta in datos["incorrectas"]:
		opciones.append(incorrecta)
	# Revolver respuestas
	opciones.shuffle()
	# Colocar textos
	for i in range(botones.size()):
		# Texto en labels
		botonesT[i].text = opciones[i]
		# Guardar metadata
		botones[i].set_meta(
			"correcto",
			opciones[i] == respuesta_correcta_actual)
		# Cambiar color del texto
		if opciones[i] == respuesta_correcta_actual:
			botonesT[i].modulate = Color.GREEN
		else:
			botonesT[i].modulate = Color.RED
	if inicio==false:
		inicio_con_delay()
		inicio=true
	else:
		delay_entre_preguntas()

# =====================================================
# DELAY INICIAL
# =====================================================
func inicio_con_delay():
	puede_responder = false
	for boton in botones:
		_textoapagado()
		boton.disabled = true
	await get_tree().create_timer(5).timeout
	for boton in botones:
		_textoencendido()
		boton.disabled = false
	puede_responder = true
	$"../../TextureRect3".visible=false

# =====================================================
# DELAY ENTRE PREGUNTAS
# =====================================================
func delay_entre_preguntas():
	puede_responder = false
	for boton in botones:
		_textoapagado()
		boton.disabled = true
	await get_tree().create_timer(cooldown-4).timeout
	for boton in botones:
		_textoencendido()
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
		GlobalPreguntas.GlobalCorrectaJ1.append(1)


	else:
		emit_signal("respuesta_incorrecta")
		sfx_incorrecto.play()
		GlobalPreguntas.GlobalCorrectaJ1.append(0)
	GlobalPreguntas.GlobalRespuestasJ1.append(respuesta_correcta_actual)
	esperar_siguiente_pregunta()
# =====================================================
# ESPERAR SIGUIENTE PREGUNTA
# =====================================================
func esperar_siguiente_pregunta():
	for boton in botones:
		boton.disabled = true

	await get_tree().create_timer(cooldown).timeout

	$"../..".nueva_pregunta_j1()

# =====================================================
# TEXTOS ENCENDIOS O APAGADOS
# =====================================================
func _textoapagado():
	for i in range(botones.size()):
		botonesT[i].modulate = Color("00000043")
func _textoencendido():
	for i in range(botones.size()):
		botonesT[i].modulate = Color.WHITE

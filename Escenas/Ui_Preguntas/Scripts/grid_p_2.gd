extends GridContainer
#=====================VARIABLES AUDIOS========================
@export var sfx_correcto : AudioStreamPlayer
@export var sfx_incorrecto : AudioStreamPlayer

# ======CONFIGURAR BOTONES======
@onready var botones = [$Bt_2A,$Bt_2B,$Bt_2C,$Bt_2D]
# Labels hijos
@onready var botonesT = [%TextBt_2A,%TextBt_2B,%TextBt_2C,%TextBt_2D]

# ======SEÑALES ======
signal respuesta_correcta2
signal respuesta_incorrecta2

# ============VARIABLES============
var puede_responder = false
var respuesta_correcta_actual = ""
@export var cooldown : float = 1
var inicio=false

# ======FUNCION READY======
func _ready():
	# Conectar botones
	for boton in botones:
		boton.pressed.connect(_on_boton_pressed.bind(boton))
		# Desactivar mouse
		boton.mouse_filter = Control.MOUSE_FILTER_IGNORE
		# Desactivar visualmente
		boton.disabled = true
		
# ============RECIBIR PREGUNTA============
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
	if inicio==false:
		inicio_con_delay()
		inicio=true
	else:
		delay_entre_preguntas()


# ============DELAY INICIAL============
func inicio_con_delay():
	puede_responder = false
	for boton in botones:
		_textoapagado()
		boton.disabled = true
	await get_tree().create_timer(5).timeout
	for boton in botones:
		if GlobalPreguntas.Debug==false:
			_textoencendido()
		else:
			_textodebug()
		boton.disabled = false
	puede_responder = true
	$"../../TextureRect3".visible=false
	$"../../TextureRect4".visible=false

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
		if GlobalPreguntas.Debug==false:
			_textoencendido()
		else:
			_textodebug()
		boton.disabled = false
	puede_responder = true
# ============FUNCION PROCESS============
func _process(delta):
	if not puede_responder:
		return
	if Input.is_action_just_pressed("Boton2A"):
		botones[0].emit_signal("pressed")

	if Input.is_action_just_pressed("Boton2B"):
		botones[1].emit_signal("pressed")

	if Input.is_action_just_pressed("Boton2C"):
		botones[2].emit_signal("pressed")

	if Input.is_action_just_pressed("Boton2D"):
		botones[3].emit_signal("pressed")

# =====================================================
# PRESIONAR BOTÓN
# =====================================================
func _on_boton_pressed(boton):
	print("J2 RESPUESTA")
	if not puede_responder:
		return

	puede_responder = false

	if boton.get_meta("correcto"):
		emit_signal("respuesta_correcta2")
		sfx_correcto.play()
		GlobalPreguntas.GlobalCorrectaJ2.append(1)
		
	else:
		emit_signal("respuesta_incorrecta2")
		sfx_incorrecto.play()
		GlobalPreguntas.GlobalCorrectaJ2.append(0) 
	GlobalPreguntas.GlobalRespuestasJ2.append(respuesta_correcta_actual)
	esperar_siguiente_pregunta()


# ======COOLDOWN ENTRE PREGUNTAS ======
func esperar_siguiente_pregunta():
	for boton in botones:
		boton.disabled = true
	await get_tree().create_timer(cooldown).timeout
	$"../..".nueva_pregunta_j2()
	
	# =====================================================
# TEXTOS ENCENDIOS O APAGADOS
# =====================================================
func _textoapagado():
	for i in range(botones.size()):
		botonesT[i].modulate = Color("00000043")
func _textoencendido():
	for i in range(botones.size()):
		botonesT[i].modulate = Color.WHITE
		
func _textodebug():
	for i in range(botones.size()):
		if botones[i].get_meta("correcto"):
			botonesT[i].modulate = Color.GREEN
		else:
			botonesT[i].modulate = Color.RED

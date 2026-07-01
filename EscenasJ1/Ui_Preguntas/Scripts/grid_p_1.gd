extends GridContainer

#=====================VARIABLES AUDIOS========================
@export var sfx_correcto : AudioStreamPlayer
@export var sfx_incorrecto : AudioStreamPlayer

# ======CONFIGURAR BOTONES======
@onready var botones = [$Bt_1A,$Bt_1B,$Bt_1C,$Bt_1D]
@onready var botonesT = [%TextBt_1A,%TextBt_1B,%TextBt_1C,%TextBt_1D]

# ============ SEÑALES============
signal respuesta_correcta
signal respuesta_incorrecta

# ============VARIABLES============
var puede_responder = false
var respuesta_correcta_actual = ""
@export var cooldown : float = 1
var inicio = false

func _ready():
	process_mode = Node.PROCESS_MODE_PAUSABLE

	for boton in botones:
		boton.pressed.connect(_on_boton_pressed.bind(boton))
		boton.mouse_filter = Control.MOUSE_FILTER_IGNORE
		boton.disabled = true

func configurar_pregunta(datos):
	respuesta_correcta_actual = datos["correcta"]

	var opciones = []
	opciones.append(datos["correcta"])

	for incorrecta in datos["incorrectas"]:
		opciones.append(incorrecta)

	opciones.shuffle()

	for i in range(botones.size()):
		botonesT[i].text = opciones[i]

		botones[i].set_meta(
			"correcto",
			opciones[i] == respuesta_correcta_actual
		)

		if opciones[i] == respuesta_correcta_actual:
			botonesT[i].modulate = Color.GREEN
		else:
			botonesT[i].modulate = Color.RED

	if inicio == false:
		inicio_con_delay()
		inicio = true
	else:
		delay_entre_preguntas()

func inicio_con_delay():
	puede_responder = false

	for boton in botones:
		_textoapagado()
		boton.disabled = true

	await get_tree().create_timer(5, false).timeout

	for boton in botones:
		if GlobalPreguntas.Debug == false:
			_textoencendido()
		else:
			_textodebug()

		boton.disabled = false

	puede_responder = true
	
	$"../../TextureRect3".visible = false

func delay_entre_preguntas():
	puede_responder = false

	for boton in botones:
		if GlobalPreguntas.Debug == false:
			_textoapagado()

		boton.disabled = true

	await get_tree().create_timer(cooldown - 4, false).timeout

	for boton in botones:
		if GlobalPreguntas.Debug == false:
			_textoencendido()
		else:
			_textodebug()

		boton.disabled = false

	puede_responder = true

func _process(delta):
	if get_tree().paused:
		return

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

func _on_boton_pressed(boton):
	if get_tree().paused:
		return

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

func esperar_siguiente_pregunta():
	for boton in botones:
		boton.disabled = true

	await get_tree().create_timer(cooldown, false).timeout

	$"../..".nueva_pregunta_j1()

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

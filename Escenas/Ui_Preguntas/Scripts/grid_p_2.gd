extends GridContainer

@export var sfx_correcto : AudioStreamPlayer
@export var sfx_incorrecto : AudioStreamPlayer

@onready var botones = [$Bt_2A,$Bt_2B,$Bt_2C,$Bt_2D]
@onready var botonesT = [%TextBt_2A,%TextBt_2B,%TextBt_2C,%TextBt_2D]

signal respuesta_correcta2
signal respuesta_incorrecta2

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
	$"../../TextureRect4".visible = false

func delay_entre_preguntas():
	puede_responder = false

	for boton in botones:
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

	if Input.is_action_just_pressed("Boton2A"):
		botones[0].emit_signal("pressed")

	if Input.is_action_just_pressed("Boton2B"):
		botones[1].emit_signal("pressed")

	if Input.is_action_just_pressed("Boton2C"):
		botones[2].emit_signal("pressed")

	if Input.is_action_just_pressed("Boton2D"):
		botones[3].emit_signal("pressed")

func _on_boton_pressed(boton):
	if get_tree().paused:
		return

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

func esperar_siguiente_pregunta():
	for boton in botones:
		boton.disabled = true

	await get_tree().create_timer(cooldown, false).timeout

	$"../..".nueva_pregunta_j2()

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

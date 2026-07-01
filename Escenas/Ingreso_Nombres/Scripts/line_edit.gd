extends LineEdit
var nombres = []
var escribiendo := false

#Funcion que hara que los nombres se guarden y parpadee la barra
func _ready():
	#Se asigna la func
	text_submitted.connect(_guardar_nombre)
	_parpadeo()

#Ajustes a la barra que parpadea
func _process(delta):
	#Ajustar línea al tamaño del texto
	var ancho = max(40, text.length() * 50)
	$ColorRect.size.x = ancho
	# Mantener centrada la línea
	$ColorRect.position.x = (size.x / 2) - (ancho / 2)

func _gui_input(event):
	# Detectar click
	if event is InputEventMouseButton:
		if event.pressed:
			escribiendo = true
			# Ocultar label de error
			$"../LabelError".text = ""

func _guardar_nombre(texto):
	# Verificar nombre válido
	if texto.strip_edges() == "":
		$"../LabelError".text = "¡Ingresa un nombre válido!"
		return
		#Verifica si el nombre del J2 es igual al del J2
	if texto.strip_edges()==Nombres.nombrej1:
		$"../LabelError".text = "¡Nombre ya utilizado! , ingresa uno diferente"
		return
	# Limpiar error
	$"../LabelError".text = ""
	nombres.append(texto)
	# Guardar 
	if nombres.size() == 1:
		Nombres.nombrej1 = texto
		$"../Instruccion".text = "Ingresa tu nombre jugador 2"
		escribiendo = false
	#Los dos nombres ya fueron ingresado
	elif nombres.size() == 2:
		Nombres.nombrej2 = texto
		#escribiendo = false
		#Cambio a la siguiente escena
		get_tree().change_scene_to_file("res://Escenas/Menu_Seleccionv2/menu.tscn")
	#Limpia el linedit
	clear()

func _parpadeo():
	#funcion que se ejecuta mientras sea la escena ejecutandose
	while is_inside_tree():
		#La linea parpadea mientras no se escriba en ella
		if not escribiendo:
			var tween = create_tween()
			tween.tween_property($ColorRect, "modulate:a", 0, 0.4)
			tween.tween_property($ColorRect, "modulate:a", 1, 0.4)
			await tween.finished
		else:
			await get_tree().process_frame

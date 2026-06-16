extends LineEdit
var nombres = []
var escribiendo := false

func _ready():
	text_submitted.connect(_guardar_nombre)
	_parpadeo()

func _process(delta):
	#Ajustar línea al tamaño del texto
	var ancho = max(40, text.length() * 20)
	$ColorRect.size.x = ancho
	# Mantener centrada la línea
	$ColorRect.position.x = (size.x / 2) - (ancho / 2)

func _gui_input(event):
	# Detectar click
	if event is InputEventMouseButton:
		if event.pressed:
			grab_focus()
			escribiendo = true
			# Ocultar error
			$"../LabelError".text = ""
			# Línea visible fija
			$ColorRect.modulate.a = 1.0

func _guardar_nombre(texto):
	# Verificar nombre válido
	if texto.strip_edges() == "":
		$"../LabelError".text = "¡Ingresa un nombre válido!"
		return
	# Limpiar error
	$"../LabelError".text = ""
	nombres.append(texto)
	# Guardar 
	if nombres.size() == 1:
		Nombres.nombrej1 = texto
		escribiendo = false
		print(Nombres.nombrej1)
		print(Nombres.nombrej2)
		get_tree().change_scene_to_file("res://EscenasJ1/Menu_Seleccionv2/menu.tscn")
	clear()


func _parpadeo():
	while true:
		#Solo parpadea si no escribe
		if not escribiendo:
			var tween = create_tween()
			tween.tween_property($ColorRect,"modulate:a",0,0.4)
			tween.tween_property($ColorRect,"modulate:a",1,0.4)
			await tween.finished
		else:
			await get_tree().process_frame

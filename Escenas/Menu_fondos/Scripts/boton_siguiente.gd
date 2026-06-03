extends Button
@export var sfx_hover : AudioStreamPlayer
@export var sfx_press : AudioStreamPlayer
func _on_pressed() -> void:
	var total = Fondos.fondosminiatura.size()
	Fondos.Fondo_jugar = (Fondos.Fondo_jugar + 1) % total
	$"../../Parallax2D".cambiar_fondo(Fondos.Fondo_jugar)
	$"..".actualizar_cinta()
	if Fondos.Fondo_jugar == 0:
		$"../Mapa".texture = load("res://sprites/Seleccion_estadio/mapa1.png")
		$"../Estadio_nombre".text=("Zacatecas")
	elif Fondos.Fondo_jugar == 1:
		$"../Mapa".texture = load("res://sprites/Seleccion_estadio/mapa2.png")
		$"../Estadio_nombre".text=("Durango")
	if Fondos.Fondo_jugar == 2:
		$"../Mapa".texture = load("res://sprites/Seleccion_estadio/mapa3.png")
		$"../Estadio_nombre".text=("Coahuila")
	elif Fondos.Fondo_jugar == 3:
		$"../Mapa".texture = load("res://sprites/Seleccion_estadio/mapa4.png")
		$"../Estadio_nombre".text=("Aleatorio")
	sfx_press.play()
	print(Fondos.Fondo_jugar)

func _on_mouse_entered() -> void:
	sfx_hover.play()
func _on_focus_entered() -> void:
	pass # Replace with function body.

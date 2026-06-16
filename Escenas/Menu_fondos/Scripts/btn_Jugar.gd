extends TextureButton
#Sonidos
@export var sfx_hover : AudioStreamPlayer
@export var sfx_press : AudioStreamPlayer
#Funcion Ready
func _ready() -> void:
	#Detecta si se presiono
	pressed.connect(_jugar)
func _jugar():
	_aleatorio()
	sfx_press.play()
	#Esperar que se reproduzca el efecto
	await get_tree().create_timer(0.2).timeout
	#Ir al menu
	get_tree().change_scene_to_file("res://Escenas/Estadios/Estadio1.tscn")
func _on_mouse_entered() -> void:
	sfx_hover.play()


func _aleatorio():
	if Fondos.Fondo_jugar == 3:
		Fondos.Fondo_jugar = randi_range(0, Fondos.fondos.size() - 1)
		print(Fondos.Fondo_jugar)

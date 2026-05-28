extends TextureButton
#Sonidos
@export var sfx_hover : AudioStreamPlayer
@export var sfx_press : AudioStreamPlayer
#Funcion Ready
func _ready() -> void:
	#Detecta si se presiono
	pressed.connect(_jugar)

	#Funcion que lleva al menu
func _process(delta: float) -> void:
	if $"../Jugador1/Seleccion/Select".visible==true and $"../Jugador2/Seleccion/Select".visible==true:
		disabled=false
	else:
		disabled=true
func _jugar():
	sfx_press.play()
	#Esperar que se reproduzca el efecto
	await get_tree().create_timer(0.2).timeout
	#Ir al menu
	get_tree().change_scene_to_file("res://Escenas/Estadios/Estadio1.tscn")
func _on_mouse_entered() -> void:
	sfx_hover.play()

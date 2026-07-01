
extends TextureButton
#Sonidos
@export var sfx_hover : AudioStreamPlayer
@export var sfx_press : AudioStreamPlayer
#Funcion Ready
func _ready() -> void:
	#Detecta si se presiono
	pressed.connect(_jugar)

#Funcion que lleva a la siguiente escena
func _process(delta: float) -> void:
	#Verifica si los dos jugadores ya seleccionaron un personake
	if $"../Jugador1/Seleccion/Select".visible==true and $"../Jugador2/Seleccion/Select".visible==true:
		#En caso que no el boton esta deshabilitado
		disabled=false
	else:
		disabled=true
func _jugar():
	sfx_press.play()
	#Esperar que se reproduzca el efecto
	await get_tree().create_timer(0.2).timeout
	#Ir al menu
	get_tree().change_scene_to_file("res://Escenas/Menu_fondos/fondo.tscn")
func _on_mouse_entered() -> void:
	if disabled==false:
		sfx_hover.play()

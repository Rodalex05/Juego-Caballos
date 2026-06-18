extends TextureButton
#Sonidos
@export var sfx_hover : AudioStreamPlayer
@export var sfx_press : AudioStreamPlayer
#Funcion Ready
func _ready() -> void:
	#Detecta si se presiono
	pressed.connect(_jugar)

func _jugar():
	sfx_press.play()
	#Esperar que se reproduzca el efecto
	await get_tree().create_timer(0.2).timeout
	#Ir al menu
	get_tree().change_scene_to_file("res://EscenasJ1/Menu_Seleccionv2/menu.tscn")
	
func _on_mouse_entered() -> void:
	sfx_hover.play()

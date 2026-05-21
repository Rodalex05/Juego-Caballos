extends Button
#Sonidos
@export var sfx_hover : AudioStreamPlayer2D
@export var sfx_press : AudioStreamPlayer2D
#Funcion Ready
func _ready() -> void:
	#Detecta si se presiono
	pressed.connect(_menu)
	#Funcion que lleva al menu
func _menu():
	sfx_press.play()
	#Esperar que se reproduzca el efecto
	await get_tree().create_timer(0.2).timeout
	#Ir al menu
	get_tree().change_scene_to_file("res://Escenas/Menu_Principal/menu_principal.tscn")
func _on_mouse_entered() -> void:
	sfx_hover.play()

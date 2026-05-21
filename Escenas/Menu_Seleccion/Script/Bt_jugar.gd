extends Button
#Audios
@export var sfx_hover : AudioStreamPlayer2D
@export var sfx_press : AudioStreamPlayer2D
#Ready
func _ready() -> void:
	#mandar a jugar
	pressed.connect(_jugar)
	#Funcion que manda al nivel
func _jugar():
	#Sonido de presionar
	sfx_press.play()
	#Esperar a que se reproduzca el sonido
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://Escenas/Estadios/Estadio1.tscn")
#Funcion que suena al pasar con el mouse
func _on_mouse_entered() -> void:
	sfx_hover.play()

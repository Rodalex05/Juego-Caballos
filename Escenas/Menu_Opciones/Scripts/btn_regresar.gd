extends TextureButton
#Varibales de audio
@export var sfx_pasar : AudioStreamPlayer2D
@export var sfx_select : AudioStreamPlayer2D

#Funcion que detecta el mouse
func _ready() -> void:
	pressed.connect(_menu)
	
#Funcion que manda al menu hacia abajo
func _menu():
	#Reproduce el sonido 
	sfx_select.play()
	#Manda el panel hacia abajo
	$"../.."._movimientoabajo()

#Reproduce el sonido si se pasa por encima
func _on_mouse_entered() -> void:
	sfx_pasar.play()

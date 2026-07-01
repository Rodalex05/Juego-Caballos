extends CheckButton
#sonidos
@export var sfx_toggle: AudioStreamPlayer2D
#Checha si el juego ya esta en pantalla completa
func _ready() -> void:
	if Cursor.Fullscreen==true:
		button_pressed = true 
	elif Cursor.Fullscreen==false:
		button_pressed=false
#cambia de pantalla completa a no
func _on_toggled(toggled_on: bool) -> void:
	sfx_toggle.play()
	#si se prende el check
	if toggled_on:
		Cursor.Fullscreen=true
		_Pantalla()
		#si se apaga el check
	else:
		Cursor.Fullscreen=false
		_Pantalla()
		
	#======FUNCION QUE AJUSTA LAS DIMENCIONES DE PANTALLA O APAGA LA FULLSCREEN======
func _Pantalla():
	#Si la pantalla completa es activada
	if Cursor.Fullscreen==true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
		$"../Opciones_Resolucion".selected = 0
	#Si la pantalla completa es desactivadas
	elif Cursor.Fullscreen==false:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		$"../Opciones_Resolucion".selected = Cursor.Resolucion
		
		

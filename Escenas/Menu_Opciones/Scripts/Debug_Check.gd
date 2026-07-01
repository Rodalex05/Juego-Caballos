extends CheckButton
@export var sfx_toggle: AudioStreamPlayer2D
func _on_toggled(toggled_on: bool) -> void:
	#Revisa que el boton esta activado
	if toggled_on:
		print("Modo Debug Encendido")
		#El modo debug se activa (ver la respuesta correcta en el juego)
		GlobalPreguntas.Debug=true
	#El boton no esta activado
	else:
		print("Modo Debug Apagado")
		#El modo debug se desactiva
		GlobalPreguntas.Debug=false
	sfx_toggle.play()

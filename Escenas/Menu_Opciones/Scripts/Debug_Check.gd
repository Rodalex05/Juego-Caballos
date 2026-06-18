extends CheckButton
func _on_toggled(toggled_on: bool) -> void:
	if toggled_on:
		print("Modo Debug Encendido")
		GlobalPreguntas.Debug=true
		print(GlobalPreguntas.Debug)
	else:
		print("Modo Debug Apagado")
		GlobalPreguntas.Debug=false
		print(GlobalPreguntas.Debug)

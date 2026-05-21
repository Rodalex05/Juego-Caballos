extends CheckButton
#sonidos
@export var sfx_toggle: AudioStreamPlayer2D
#cambia de pantalla completa a no
func _on_toggled(toggled_on: bool) -> void:
	sfx_toggle.play()
	#si se prende el check
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
			#si se apaga el check
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

		

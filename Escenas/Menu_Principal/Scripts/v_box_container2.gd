extends VBoxContainer
#======FUNCION QUE MUEVEN LOS BOTONES A LA IZQUIERDA======
func _izqmover():
	#Manda a mover cada boton y deja un tiempo entre cada uno
	$Btn_UnJ1._movimientoizq()
	await get_tree().create_timer(.2).timeout
	$Btn_Multijugador._movimientoizq()
	await get_tree().create_timer(.2).timeout
	$Btn_Regresar._movimientoizq()
	await get_tree().create_timer(1).timeout
	
	#Se habilitan los botones 
	$Btn_UnJ1.disabled = false
	$Btn_Multijugador.disabled = false
	$Btn_Regresar.disabled = false
	
#======FUNCION QUE MUEVEN LOS BOTONES A LA DERECHA======
func _dermover():
	#Se deshabilitan los botones 
	$Btn_UnJ1.disabled = true
	$Btn_Multijugador.disabled = true
	$Btn_Regresar.disabled = true
	
	#Manda a mover cada boton y deja un tiempo entre cada uno
	$Btn_UnJ1._movimientoder()
	await get_tree().create_timer(.2).timeout
	$Btn_Multijugador._movimientoder()
	await get_tree().create_timer(.2).timeout
	$Btn_Regresar._movimientoder()
	
	#Manda a llamar a la primera tabla de botones a la derecha
	%VBC_Opciones1._dermover()

	

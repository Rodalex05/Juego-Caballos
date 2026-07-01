extends VBoxContainer
#======FUNCION QUE MUEVEN LOS BOTONES A LA IZQUIERDA======
func _izqmover():
	#Se deshabilitan los botones 
	$Btn_Iniciar.disabled = true
	$Btn_Opciones.disabled = true
	$Btn_Salir.disabled = true
	#Manda a mover cada boton y deja un tiempo entre cada uno
	$Btn_Iniciar._movimientoizq()
	await get_tree().create_timer(.2).timeout
	$Btn_Opciones._movimientoizq()
	await get_tree().create_timer(.2).timeout
	$Btn_Salir._movimientoizq()
	#Manda a llamar a la segunda tabla de botones a la izquierda
	%VBC_Opciones2._izqmover()

#======FUNCION QUE MUEVEN LOS BOTONES A LA DERECHA======
func _dermover():
	#Manda a mover cada boton y deja un tiempo entre cada uno
	$Btn_Iniciar._movimientoder()
	await get_tree().create_timer(.2).timeout
	$Btn_Opciones._movimientoder()
	await get_tree().create_timer(.2).timeout
	$Btn_Salir._movimientoder()
	await get_tree().create_timer(1).timeout
	#Se habilitan los botones 
	$Btn_Iniciar.disabled = false
	$Btn_Opciones.disabled = false
	$Btn_Salir.disabled = false

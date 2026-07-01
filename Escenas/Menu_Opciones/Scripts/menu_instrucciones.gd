extends Control
#======FUNCION QUE SUBE EL PANEL DE CONFIGURACION======
func _movimientoarriba():
	#Deshabilitar el boton de creditos
	$"../Btn_Creditos".disabled=true
	#Deshabilitar el boton de opciones
	$"../VBC_Opciones1/Btn_Opciones".disabled=true
	var tween: Tween = create_tween()
	tween.tween_property(self,"position:y",position.y-1000,.5).set_trans(tween.TRANS_CUBIC)

#======FUNCION QUE BAJA EL PANEL DE CONFIGURACION======
func _movimientoabajo():
	#Habilita el boton de creditos
	$"../Btn_Creditos".disabled=false
	#Habilitar el boton de opciones
	$"../VBC_Opciones1/Btn_Opciones".disabled=false
	var tween: Tween = create_tween()
	tween.tween_property(self,"position:y",position.y+1000,.5).set_trans(tween.TRANS_CUBIC)

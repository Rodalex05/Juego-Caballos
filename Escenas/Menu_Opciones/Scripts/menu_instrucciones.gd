extends Control
func _movimientoarriba():
	$"../Btn_Creditos".disabled=true
	$"../VBoxContainer/Btn_Opciones".disabled=true
	var tween: Tween = create_tween()
	tween.tween_property(self,"position:y",position.y-1000,.5).set_trans(tween.TRANS_CUBIC)

func _movimientoabajo():
	$"../Btn_Creditos".disabled=false
	$"../VBoxContainer/Btn_Opciones".disabled=false
	var tween: Tween = create_tween()
	tween.tween_property(self,"position:y",position.y+1000,.5).set_trans(tween.TRANS_CUBIC)
	$"../VBoxContainer/Btn_Opciones".disabled=false

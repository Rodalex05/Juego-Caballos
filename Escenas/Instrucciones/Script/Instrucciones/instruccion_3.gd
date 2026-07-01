extends VBoxContainer
#Desliza la instruccion hacia arriba
func _arriba():
	var tween: Tween = create_tween()
	tween.tween_property(self,"position:y",position.y-50,.5).set_trans(tween.TRANS_CUBIC)
	await get_tree().create_timer(.2).timeout
	#hace visible la instruccion
	modulate.a = 1
	var tween2: Tween = create_tween()
	tween2.tween_property(self,"position:y",position.y+50,.5).set_trans(tween.TRANS_CUBIC)

extends TextureRect

func _movimientoizq():
	var tween: Tween = create_tween()
	tween.tween_property(self,"position:x",position.x-180,.1).set_trans(tween.TRANS_CUBIC)

func _movimientoder():
	var tween: Tween = create_tween()
	tween.tween_property(self,"position:x",position.x+180,.1).set_trans(tween.TRANS_CUBIC)

func _movimientoarriba():
	var tween: Tween = create_tween()
	tween.tween_property(self,"position:y",position.y-180,.1).set_trans(tween.TRANS_CUBIC)

func _movimientoabajo():
	var tween: Tween = create_tween()
	tween.tween_property(self,"position:y",position.y+180,.1).set_trans(tween.TRANS_CUBIC)

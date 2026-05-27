extends TextureRect

func _mover():
	var tween = create_tween()
	tween.tween_property(self,"position:y",position.y + 400,1.0).set_trans(Tween.TRANS_QUART)

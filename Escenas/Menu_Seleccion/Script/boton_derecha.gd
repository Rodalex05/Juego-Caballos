extends Button
var pos_original = 587

func _arriba():
	disabled=true
	var tween: Tween = create_tween()

	tween.tween_property(self, "position:x", pos_original + 5, 0.1)\
	.set_trans(Tween.TRANS_CUBIC)

	tween.tween_property(self, "position:x", pos_original, 0.1)\
	.set_trans(Tween.TRANS_CUBIC)
	await tween.finished
	disabled=false

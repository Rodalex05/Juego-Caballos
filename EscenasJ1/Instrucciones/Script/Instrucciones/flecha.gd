extends TextureRect
func _ready() -> void:
		modulate.a = 0
		position.x-=100
func _arriba():
	var tween: Tween = create_tween()
	tween.tween_property(self,"position:x",position.x+100,.5).set_trans(tween.TRANS_CUBIC)
	await get_tree().create_timer(.2).timeout
	modulate.a = 1
	

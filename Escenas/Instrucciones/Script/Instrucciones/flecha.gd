extends TextureRect
func _ready() -> void:
	#Inicia la flecha invisible y ajustada a la zona 
		modulate.a = 0
		position.x-=100

#Movimiento de la flecha y hacerse visible
func _arriba():
	#Movimiento de la flecha
	var tween: Tween = create_tween()
	tween.tween_property(self,"position:x",position.x+100,.5).set_trans(tween.TRANS_CUBIC)
	await get_tree().create_timer(.2).timeout
	#La flecha se hace visible
	modulate.a = 1
	

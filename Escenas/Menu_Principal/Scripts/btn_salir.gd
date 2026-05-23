extends Button
#Variables de sonido
@export var sfx_pasar : AudioStreamPlayer2D
@export var sfx_select : AudioStreamPlayer2D
#Si se presiona el boton
func _ready() -> void:
	pressed.connect(_salir)
#Salir del juego
func _salir():	
	sfx_select.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().quit()
	#Reproduce el sonido
func _on_mouse_entered() -> void:
	sfx_pasar.play()
func _movimientoizq():
	var tween: Tween = create_tween()
	tween.tween_property(self,"position:x",position.x-2000,1).set_trans(tween.TRANS_CUBIC)
func _movimientoder():
	var tween: Tween = create_tween()
	tween.tween_property(self,"position:x",position.x+2000,1).set_trans(tween.TRANS_CUBIC)

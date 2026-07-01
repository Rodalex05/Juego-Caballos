extends Control
func _ready() -> void:
	await get_tree().create_timer(3.0).timeout
	$Fondonegro/Tiempo.text=("Tiempo total : " + GlobalTiempo.tiempo)
	_movimientoarriba()
func _movimientoarriba():
	var tween: Tween = create_tween()
	tween.tween_property(self,"position:y",position.y-1200,1).set_trans(tween.TRANS_CUBIC)
	await tween.finished
	await get_tree().create_timer(2.0).timeout
	$Fondonegro/Btn_Regresar.disabled=false

extends Button
#Variables de sonido y siguiente escena
@export var sfx_pasar : AudioStreamPlayer2D
@export var sfx_select : AudioStreamPlayer2D
@export var escena_seleccion: PackedScene

#Si se presiona el boton
func _ready() -> void:
	pressed.connect(_opciones)
	#Manda al siguiente menu
func _opciones():
	sfx_select.play()
	
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_packed(escena_seleccion)

#Sonar si se pasa el mouse encima
func _on_mouse_entered() -> void:
	sfx_pasar.play()
	
func _movimientoizq():
	var tween: Tween = create_tween()
	tween.tween_property(self,"position:x",position.x-2000,1).set_trans(tween.TRANS_CUBIC)
func _movimientoder():
	var tween: Tween = create_tween()
	tween.tween_property(self,"position:x",position.x+2000,1).set_trans(tween.TRANS_CUBIC)

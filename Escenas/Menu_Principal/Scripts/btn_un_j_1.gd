extends TextureButton
#Variables de sonido y siguiente escena
@export var escena_seleccion: PackedScene
@export var sfx_pasar : AudioStreamPlayer2D
@export var sfx_select : AudioStreamPlayer2D

#Si se presiona el boton
func _ready() -> void:
	pressed.connect(_jugar)
	
#Manda al siguiente menu
func _jugar():
	#Reproduce el sonido
	sfx_select.play()
	#Espera que se reproduce el sonido
	await get_tree().create_timer(0.2).timeout
	#Ir a la siguiente escena
	get_tree().change_scene_to_packed(escena_seleccion)
	
#Sonar si se pasa el mouse encima
func _on_mouse_entered() -> void:
	sfx_pasar.play()
	
#Movimiento a la izquierda
func _movimientoizq():
	var tween: Tween = create_tween()
	tween.tween_property(self,"position:x",position.x-2000,1).set_trans(tween.TRANS_CUBIC)

#Movimiento a la derecha
func _movimientoder():
	var tween: Tween = create_tween()
	tween.tween_property(self,"position:x",position.x+2000,1).set_trans(tween.TRANS_CUBIC)

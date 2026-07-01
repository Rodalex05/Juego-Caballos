extends TextureButton
#Variables de sonido y siguiente escena
@export var sfx_pasar : AudioStreamPlayer2D
@export var sfx_select : AudioStreamPlayer2D

#Si se presiona el boton
func _ready() -> void:
	pressed.connect(_opciones)
	
#Manda a llamar al menu de opciones a aparecer
func _opciones():
	sfx_select.play()
	%Opciones_Menu._movimientoarriba()

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

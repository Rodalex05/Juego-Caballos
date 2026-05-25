extends TextureButton
@export var sfx_pasar : AudioStreamPlayer2D
@export var sfx_select : AudioStreamPlayer2D

func _ready() -> void:
	pressed.connect(_menu)
func _menu():
	sfx_select.play()
	$"../.."._movimientoabajo()

func _on_mouse_entered() -> void:
	sfx_pasar.play()

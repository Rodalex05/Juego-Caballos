extends TextureButton
@export var sfx_pasar : AudioStreamPlayer
@export var sfx_select : AudioStreamPlayer

func _ready() -> void:
	pressed.connect(_menu)
func _menu():
	sfx_select.play()
	$"..".position.y+=1000
	$".."._volver()

func _on_mouse_entered() -> void:
	sfx_pasar.play()

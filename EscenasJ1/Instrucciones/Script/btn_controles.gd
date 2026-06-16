extends TextureButton
@export var sfx_pasar : AudioStreamPlayer
@export var sfx_select : AudioStreamPlayer
#manda al menu principal
func _ready() -> void:
	pressed.connect(_menu)
func _menu():
	#Reproduce el sonido
	sfx_select.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://Escenas/Menu_Controles/controles.tscn")

#Sonar si se pasa el mouse encima
func _on_mouse_entered() -> void:
	sfx_pasar.play()

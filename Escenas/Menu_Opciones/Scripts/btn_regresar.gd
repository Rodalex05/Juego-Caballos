extends Button
@export var menu_principal: PackedScene
@export var sfx_pasar : AudioStreamPlayer2D
@export var sfx_select : AudioStreamPlayer2D

func _ready() -> void:
	pressed.connect(_menu)
func _menu():
	sfx_select.play()

	await get_tree().create_timer(0.2).timeout

	get_tree().change_scene_to_file("res://Escenas/Menu_Principal/menu_principal.tscn")

func _on_mouse_entered() -> void:
	sfx_pasar.play()

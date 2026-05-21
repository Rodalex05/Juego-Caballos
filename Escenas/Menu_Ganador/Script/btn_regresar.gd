extends Button
#manda al menu principal
func _ready() -> void:
	pressed.connect(_menu)
func _menu():
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://Escenas/Menu_Principal/menu_principal.tscn")

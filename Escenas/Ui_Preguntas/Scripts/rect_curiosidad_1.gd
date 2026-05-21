extends ColorRect
func _ready():
	$".".visible = false

func _on_grid_j_1_respuesta_correcta() -> void:
	pass # Replace with function body.
	$".".visible = true
	await get_tree().create_timer(3.0).timeout
	$".".visible = false

func _on_grid_j_1_respuesta_incorrecta() -> void:
	pass # Replace with function body.

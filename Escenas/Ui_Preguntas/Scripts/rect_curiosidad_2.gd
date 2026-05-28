extends TextureRect
func _ready():
	$".".visible = false

func _on_grid_j_2_respuesta_correcta_2() -> void:
	$".".visible = true
	await get_tree().create_timer(5).timeout
	$".".visible = false

func _on_grid_j_2_respuesta_incorrecta_2() -> void:
	$".".visible = true
	await get_tree().create_timer(5).timeout
	$".".visible = false

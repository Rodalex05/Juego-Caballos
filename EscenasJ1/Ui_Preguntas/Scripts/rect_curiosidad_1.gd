extends TextureRect
func _ready():
	$".".visible = false

func _on_grid_j_1_respuesta_correcta() -> void:
	$".".visible = true
	await get_tree().create_timer(3.5).timeout
	$".".visible = false

func _on_grid_j_1_respuesta_incorrecta() -> void:
	$".".visible = true
	await get_tree().create_timer(3.5).timeout
	$".".visible = false

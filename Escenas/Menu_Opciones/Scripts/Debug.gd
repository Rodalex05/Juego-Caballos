extends HBoxContainer
#HBox visible si se pasa por encima del mouse
func _on_mouse_entered() -> void:
	$LB_Debug.visible = true
	$Check_Debug.visible = true

#Si no esta el mouse encima se vuelve invisible
func _on_mouse_exited() -> void:
	if not get_global_rect().has_point(get_global_mouse_position()):
		$LB_Debug.visible = false
		$Check_Debug.visible = false

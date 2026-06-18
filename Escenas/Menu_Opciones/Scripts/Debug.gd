extends HBoxContainer

func _ready() -> void:
	$Label.visible = false
	$CheckButton.visible = false

func _on_mouse_entered() -> void:
	$Label.visible = true
	$CheckButton.visible = true

func _on_mouse_exited() -> void:
	if not get_global_rect().has_point(get_global_mouse_position()):
		$Label.visible = false
		$CheckButton.visible = false

extends ColorRect

func _ready() -> void:
	visible = false

func _seleccionado():
	visible = true

func _desseleccionado():
	visible = false

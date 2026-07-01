extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animar_escala_permanente()

func animar_escala_permanente():
	var tween = create_tween()
	tween.set_loops()

	tween.tween_property(self, "scale", Vector2(1.2, 1.2), 0.5)
	tween.tween_property(self, "scale", Vector2(1, 1), 0.5)

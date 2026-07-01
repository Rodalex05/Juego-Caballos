extends Label
var archivo=""
func _ready():
	pivot_offset = size / 2
	position.x=1105.0
	position.y=341.0
	animar_escala_permanente()
	text = _texto()

func animar_escala_permanente():
	var tween = create_tween()
	tween.set_loops()

	tween.tween_property(self, "scale", Vector2(1.2, 1.2), 0.3)
	tween.tween_property(self, "scale", Vector2(1, 1), 0.3)

func _texto():
	var archivo = FileAccess.open("res://splashtexts.csv", FileAccess.READ)
	var valores = []

	while not archivo.eof_reached():
		var fila = archivo.get_csv_line()

		if fila.size() > 0:
			valores.append(fila[0])

	if valores.size() == 0:
		return ""

	return valores.pick_random()

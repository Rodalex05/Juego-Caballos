extends RichTextLabel

func _ready() -> void:
	_imprimir()

func _imprimir():
	var texto := ""
	for i in range(GlobalPreguntas.GlobalRespuestasJ1.size()):
		texto += "[img=64x64]res://sprites/Ganador/pregunta_icon.png[/img] Pregunta " + str(i + 1) + ": "
		texto += GlobalPreguntas.GlobalPreguntasJ1[i] + "\n"
		if GlobalPreguntas.GlobalCorrectaJ1[i] == 1:
			texto += "[img=32x32]res://sprites/Ganador/Correcta_icon.png[/img]"
		else:
			texto += "[img=32x32]res://sprites/Ganador/Incorrecta_icon.png[/img]"
		texto += GlobalPreguntas.GlobalRespuestasJ1[i] + "\n"

	self.text = texto

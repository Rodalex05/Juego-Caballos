extends RichTextLabel

func _ready() -> void:
	_imprimir()

func _imprimir():
	var texto := ""
	for i in range(GlobalPreguntas.GlobalRespuestasJ2.size()):
		texto += "[img=64x64]res://sprites/Ganador/pregunta_icon.png[/img] Pregunta " + str(i + 1) + ": "
		texto += GlobalPreguntas.GlobalPreguntasJ2[i] + "\n"
		if GlobalPreguntas.GlobalCorrectaJ2[i] == 1:
			texto += "[img=32x32]res://sprites/Ganador/Correcta_icon.png[/img]"
		else:
			texto += "[img=32x32]res://sprites/Ganador/Incorrecta_icon.png[/img]"
		texto += GlobalPreguntas.GlobalRespuestasJ2[i] + "\n"

	self.text = texto

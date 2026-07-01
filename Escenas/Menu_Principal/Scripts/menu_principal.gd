extends Control
#======LIMPIEZA DE VARIABLES Y PAUSA
func _ready() -> void:
	GlobalPreguntas.GlobalPreguntasJ1.clear()
	GlobalPreguntas.GlobalPreguntasJ2.clear()
	GlobalPreguntas.GlobalRespuestasJ1.clear()
	GlobalPreguntas.GlobalRespuestasJ2.clear()
	GlobalPreguntas.GlobalCorrectaJ1.clear()
	GlobalPreguntas.GlobalCorrectaJ2.clear()
	get_tree().paused = false
	GlobalPreguntas.Debug=false
	print("Variables limpias")

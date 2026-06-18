extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalPreguntas.GlobalPreguntasJ1.clear()
	GlobalPreguntas.GlobalPreguntasJ2.clear()
	GlobalPreguntas.GlobalRespuestasJ1.clear()
	GlobalPreguntas.GlobalRespuestasJ2.clear()
	GlobalPreguntas.GlobalCorrectaJ1.clear()
	GlobalPreguntas.GlobalCorrectaJ2.clear()
	print("Variables limpias")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

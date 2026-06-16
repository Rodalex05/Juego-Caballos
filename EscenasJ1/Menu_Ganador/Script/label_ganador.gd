extends Label
#Imprime al ganador
func _ready() -> void:
	$".".text=("El Ganador es:\n " + Nombres.nombre_ganador)

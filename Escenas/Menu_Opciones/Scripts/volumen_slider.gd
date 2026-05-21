extends HSlider
#Nombre del bus de sonido
@export var bus_nombre: String
var bus_index: int
#Funcion ready
func _ready() -> void:
	#Lee el nombre del bus
	bus_index = AudioServer.get_bus_index(bus_nombre)
	value_changed.connect(_on_value_changed)
	#transforma la posicion del slider en volumen
	value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))
func _on_value_changed(value: float) -> void:
	#aplica el volumen seleccionado
	AudioServer.set_bus_volume_db(bus_index,linear_to_db(value))

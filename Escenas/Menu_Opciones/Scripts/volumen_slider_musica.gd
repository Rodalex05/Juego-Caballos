extends HSlider
#Nombre del bus de sonido
@export var bus_nombre: String
var bus_index: int
#Funcion ready
func _ready() -> void:
#Lee el nombre del bus
	bus_index = AudioServer.get_bus_index(bus_nombre)
	value_changed.connect(_on_value_changed)
	value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))
	
#aplica el volumen seleccionado
func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(bus_index,linear_to_db(value))

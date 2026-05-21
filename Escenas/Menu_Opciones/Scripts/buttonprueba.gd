extends Button
@export var musica: AudioStreamPlayer2D
func _ready() -> void:
	pressed.connect(_menu)

func _menu():
	musica.play()

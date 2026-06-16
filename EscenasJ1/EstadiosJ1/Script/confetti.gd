extends Control
func _ready() -> void:
	$Rojo.emitting=false
	$Verde.emitting=false
	$Azul.emitting=false
func _Confetti():
	$Rojo.emitting=true
	$Verde.emitting=true
	$Azul.emitting=true

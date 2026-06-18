extends Control
@export var ganaste: PackedScene
var Errores := 0
var textura_strike = preload("res://sprites/Ui_Preguntas/Miniguia/strike_on.png")

func _ready() -> void:
	var principal = get_tree().get_first_node_in_group("principal_preguntas")
	var grid_j1 = principal.get_node("HBoxContainer/Grid_J1")
	grid_j1.respuesta_incorrecta.connect(_contadorerrores)
	
func _contadorerrores():
	Errores += 1
	var strike = get_node_or_null("HBoxContainer/Strike" + str(Errores))
	strike.texture = textura_strike
	if Errores ==4:
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_packed(ganaste)
		$"../ColorRect/Temporizador".detener_cronometro()

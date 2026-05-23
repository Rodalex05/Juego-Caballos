extends VBoxContainer

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _izqmover():
	$Btn_Iniciar._movimientoizq()
	await get_tree().create_timer(.2).timeout
	$Btn_Opciones._movimientoizq()
	await get_tree().create_timer(.2).timeout
	$Btn_Salir._movimientoizq()
	$"../VBoxOp2"._izqmover()

func _dermover():
	$Btn_Iniciar._movimientoder()
	await get_tree().create_timer(.2).timeout
	$Btn_Opciones._movimientoder()
	await get_tree().create_timer(.2).timeout
	$Btn_Salir._movimientoder()

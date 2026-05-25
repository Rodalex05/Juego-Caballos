extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _izqmover():
	$Btn_UnJ1.disabled = true
	$Btn_Multijugador.disabled = true
	$Btn_Regresar.disabled = true
	$Btn_UnJ1._movimientoizq()
	await get_tree().create_timer(.2).timeout
	$Btn_Multijugador._movimientoizq()
	await get_tree().create_timer(.2).timeout
	$Btn_Regresar._movimientoizq()
	await get_tree().create_timer(1).timeout
	$Btn_UnJ1.disabled = false
	$Btn_Multijugador.disabled = false
	$Btn_Regresar.disabled = false
func _dermover():
	$Btn_UnJ1.disabled = true
	$Btn_Multijugador.disabled = true
	$Btn_Regresar.disabled = true
	$Btn_UnJ1._movimientoder()
	await get_tree().create_timer(.2).timeout
	$Btn_Multijugador._movimientoder()
	await get_tree().create_timer(.2).timeout
	$Btn_Regresar._movimientoder()
	%VBoxContainer._dermover()

	

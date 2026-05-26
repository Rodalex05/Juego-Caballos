extends HBoxContainer
func _ready() -> void:
	if PrimeraVez.instruccionesmulti==false:
		_animacion()
		PrimeraVez.instruccionesmulti=true
	else:
		_repetido()

func _animacion():
		$"../Btn_Siguiente".disabled=true
		await get_tree().create_timer(.2).timeout
		$Instruccion1._arriba()
		await get_tree().create_timer(.5).timeout
		$"../Flecha"._arriba()
		await get_tree().create_timer(.2).timeout
		$Instruccion2._arriba()
		await get_tree().create_timer(.5).timeout
		$"../Flecha2"._arriba()
		await get_tree().create_timer(.2).timeout
		$Instruccion3._arriba()
		await get_tree().create_timer(1).timeout
		$"../Btn_Siguiente".disabled=false
		
func _repetido():
		$Instruccion1.modulate.a=1
		$"../Flecha".modulate.a=1
		$Instruccion2.modulate.a=1
		$"../Flecha2".modulate.a=1
		$Instruccion3.modulate.a=1
		$"../Flecha".position.x+=100
		$"../Flecha2".position.x+=100

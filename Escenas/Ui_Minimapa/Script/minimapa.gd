extends Control

@export var jugador1: CharacterBody2D
@export var jugador2: CharacterBody2D

func _process(_delta):
	if $ColorRect/CabajoJ1.position.x<1754.0:
		$ColorRect/CabajoJ1.position.x = (jugador1.position.x / 10600.0) * 1820.0
	if $ColorRect/CabajoJ2.position.x<1754.0:
		$ColorRect/CabajoJ2.position.x = (jugador2.position.x / 10600.0) * 1820.0
	

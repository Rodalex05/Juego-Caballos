extends Control
@onready var izq = $PreviewIzq
@onready var centro = $PreviewCentro
@onready var der = $PreviewDer

func _ready():
	actualizar_cinta()

func actualizar_cinta():
	var total = Fondos.fondosminiatura.size()
	var actual = Fondos.Fondo_jugar
	var indice_izq = (actual - 1 + total) % total
	var indice_der = (actual + 1) % total

	izq.texture = Fondos.fondosminiatura[indice_izq]
	centro.texture = Fondos.fondosminiatura[actual]
	der.texture = Fondos.fondosminiatura[indice_der]

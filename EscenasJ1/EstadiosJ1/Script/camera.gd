extends Camera2D
@export var Pistola: AudioStreamPlayer
@onready var j1 = %Jugador1
@onready var j2 = %Jugador2
@onready var barra_arriba = $BarraArriba
@onready var barra_abajo = $BarraAbajo
@export var yinicial=10607
@export var tiempoinicial=0
@export var suavizado := 5.0
@export var offset_x := -200.0
var zoom_final = false
signal acercamiento
signal final

var y_fija := 0.0
# Controla si la cámara ya puede seguir jugadores
var seguir_jugadores := false

func _ready():
	y_fija = global_position.y
	# Espera a que termine el paneo inicial
	await _movimiento_inicial()
	# Ahora ya sigue jugadores
	seguir_jugadores = true
func _process(delta):
	# Mientras ocurre el paneo inicial no hace nada
	if !seguir_jugadores:
		return
	var lider=j1
	global_position.x = lerp(global_position.x,lider.global_position.x + offset_x,suavizado * delta)
	#global_position.y = y_fija

func _movimiento_inicial():
	# Coloca la cámara más a la derecha
	position.x += yinicial
	var tween = create_tween()
	# Paneo hacia la izquierda
	tween.tween_property(self,"position:x",position.x - yinicial,tiempoinicial).set_trans(Tween.TRANS_QUAD)
	await tween.finished
	_barras()


func _barras():
	var tween = create_tween()
	#barra superior
	tween.tween_property(barra_arriba,"position:y",barra_arriba.position.y - 200,1.5).set_trans(tween.TRANS_QUAD)
	#barra inferior
	tween.parallel().tween_property(barra_abajo,"position:y",barra_abajo.position.y + 200,1.5).set_trans(tween.TRANS_CUBIC)

	await tween.finished
	$"../../CanvasLayer/Minimapa2".visible=true
	Pistola.play()
	$"../../CanvasLayer/ColorRect/Temporizador".iniciar_cronometro()
	$"../../Musica".play()
	
	
func _zoom():
	Engine.time_scale = .5
	var tween = create_tween()
	tween.tween_property(self, "zoom", Vector2(1.5, 1.5), 1.5)
	
func _final():
	var tween = create_tween()
	tween.tween_property(self, "zoom", Vector2(1.0, 1.0), 1.5)

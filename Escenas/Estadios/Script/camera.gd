extends Camera2D


# =====================================================
# NODOS
# =====================================================

@onready var j1 = %Jugador1
@onready var j2 = %Jugador2



# =====================================================
# VARIABLES
# =====================================================

# Suavizado del movimiento de cámara
@export var suavizado := 5.0


# Mantiene fija la posición vertical
var y_fija := 0.0


# Offset horizontal de la cámara
# Negativo = cámara más a la izquierda
@export var offset_x := -200.0



# =====================================================
# READY
# =====================================================

func _ready():

	# Guarda la posición Y inicial
	y_fija = global_position.y



# =====================================================
# PROCESS
# =====================================================

func _process(delta):

	# Variable para guardar
	# qué jugador va liderando
	var lider


	# Detecta qué jugador
	# está más adelante
	if j1.global_position.x > j2.global_position.x:

		lider = j1

	else:

		lider = j2


	# Sigue al líder suavemente
	# aplicando offset horizontal
	global_position.x = lerp(

		global_position.x,

		lider.global_position.x + offset_x,

		suavizado * delta
	)


	# Mantiene fija la cámara en Y
	global_position.y = y_fija

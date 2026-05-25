extends VBoxContainer
@export var sfx_pasar : AudioStreamPlayer2D
@export var sfx_select : AudioStreamPlayer2D
# =========================
# ARRAY DE SKINS
# =========================
#Cargar todas las imágenes de los caballos.
# preload() carga la imagen desde que inicia el juego
var skins = [
	preload("res://sprites/Caballos/Caballo1.png"),
	preload("res://sprites/Caballos/Caballo2.png"),
	preload("res://sprites/Caballos/Caballo3.png"),
	preload("res://sprites/Caballos/Caballo4.png"),
	preload("res://sprites/Caballos/Caballo5.png"),
	preload("res://sprites/Caballos/Caballo6.png")
]

# =========================
# NOMBRES DE LAS SKINS
# =========================
var nombres = [
	"Caballo Cafe",
	"Caballo Negro",
	"Caballo Verde",
	"Caballo Rosa",
	"Caballo Gris",
	"Caballo AMOLED",
]

# Guarda qué skin está seleccionada.
var indice := 0

# =========================================================
# FUNCION READY
# =========================================================
func _ready():
	# Mostrar la primera skin al iniciar
	actualizar_skin()
	# Conectar botones a funciones
	$HBoxContainer/BotonIzquierda.pressed.connect(anterior_skin)
	$HBoxContainer/BotonDerecha.pressed.connect(siguiente_skin)
	
func _process(delta):
	if Input.is_action_just_pressed("Skin_J1_izq"):
		anterior_skin()
	if Input.is_action_just_pressed("Skin_J1_der"):
		siguiente_skin()


# =========================================================
# ACTUALIZAR SKIN
# =========================================================
func actualizar_skin():
	$HBoxContainer/Panel/Skin_caballo.texture = skins[indice]
	# Cambiar el texto del Label con el nombre correspondiente
	$LabelNombre.text = nombres[indice]
	#Guarda la skin para usarse en el juego
	SkinsGlobal.skin_j1=indice
	
# =========================================================
# AVANZAR ENTRE SKINS
# =========================================================
# Esta función avanza a la derecha
func siguiente_skin():
	sfx_select.play()
	indice += 1
	# Si el indice supera el tamaño del array vuelve al inicio.
	if indice >= skins.size():
		indice = 0
	actualizar_skin()

# Esta función avanza a la derecha
func anterior_skin():
	sfx_select.play()
	indice -= 1
	# Si el indice supera el tamaño del array vuelve al inicio.
	if indice < 0:
		indice = skins.size() - 1
	actualizar_skin()

extends CharacterBody2D
#Variable para editar la velocidad del caballo
@export var velocidad = 300.0
var mitad_y = 410
signal acercamiento

# =====================================================
# FUNCION READY
# =====================================================
func _ready():
	#Espera en que cargue todo
	await get_tree().process_frame
	#Busca UI_Preguntas en el grupo
	var principal = get_tree().get_first_node_in_group("principal_preguntas")
	#Busca Grid_J1
	var grid_j1 = principal.get_node("HBoxContainer/Grid_J1")
	# Conecta señales
	grid_j1.respuesta_correcta.connect(_on_respuesta_correcta)
	grid_j1.respuesta_incorrecta.connect(_on_respuesta_incorrecta)
	$Label.text=Nombres.nombrej1
	$"../AreaFinal".acercamiento.connect(_acercamiento)
# =====================================================
# SEÑALES
# =====================================================
func _on_respuesta_correcta():
	# Esto se ejecuta cuando j1 responde correctamente
	correr()

func _on_respuesta_incorrecta():
# Esto se ejecuta cuando j2 responde correctamente
	detener()
# =====================================================
# PROCESS
# =====================================================
func _physics_process(delta: float) -> void:
	move_and_slide()
func correr():
	# Activa movimiento
	velocity.x = velocidad
	#Espera 5 segundos
	await get_tree().create_timer(3.5).timeout
	#Detiene el caballo
	detener()
	#Funcion que detiene al caballo
func detener():
	velocity.x = 0

func _acercamiento():
	print("diosgod")
	var tween = create_tween()
	tween.tween_property(self, "position:y", mitad_y, 1.0)
	velocity.x = velocidad
	#Espera 5 segundos
	await get_tree().create_timer(8).timeout
	detener()

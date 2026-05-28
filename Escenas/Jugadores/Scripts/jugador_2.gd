extends CharacterBody2D
#Variable para editar la velocidad del caballo
@export var velocidad = 300.0
# =====================================================
# FUNCION READY
# =====================================================
func _ready():
	#Espera en que cargue todo
	await get_tree().process_frame
	#Busca UI_Preguntas en el grupo
	var principal = get_tree().get_first_node_in_group("principal_preguntas")
	#Busca Grid_J2
	var grid_j2 = principal.get_node("HBoxContainer/Grid_J2")
	# Conecta señales
	grid_j2.respuesta_correcta2.connect(_on_respuesta_correcta2)
	grid_j2.respuesta_incorrecta2.connect(_on_respuesta_incorrecta2)
	$Label.text=Nombres.nombrej2
# =====================================================
# SEÑALES
# =====================================================
func _on_respuesta_correcta2():
	# Esto se ejecuta cuando j2 responde correctamente
	correr()

func _on_respuesta_incorrecta2():
# Esto se ejecuta cuando j2 responde incorrectamente
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
	await get_tree().create_timer(5.0).timeout
	#Detiene el caballo
	detener()
	#Funcion que detiene al caballo
func detener():
	velocity.x = 0

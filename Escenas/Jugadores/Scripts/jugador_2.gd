extends CharacterBody2D
#Variable para editar la velocidad del caballo
@export var velocidad = 300.0
var mitad_y = 410.0
signal acercamiento2
var id_movimiento = 0
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
	$"../AreaFinal".acercamiento2.connect(_acercamiento)
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
	id_movimiento += 1
	var mi_id = id_movimiento
	velocity.x = velocidad
	await get_tree().create_timer(3.5).timeout
	if mi_id == id_movimiento:
		detener()
func detener():
	velocity.x = 0
	
func _acercamiento():
	id_movimiento += 1
	var mi_id = id_movimiento
	var tween = create_tween()
	tween.tween_property(self, "position:y", mitad_y, 1.0)
	velocity.x = velocidad
	await get_tree().create_timer(4).timeout
	if mi_id == id_movimiento:
		detener()

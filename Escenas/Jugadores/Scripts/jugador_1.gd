extends CharacterBody2D
#Variable para editar la velocidad del caballo
@export var velocidad = 300.0
var mitad_y = 410
signal acercamiento
var ganador =false
# =====================================================
# FUNCION READY
# =====================================================
func _ready():
	$AnimatedSprite2D.play("idle")
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
	#Funcion que habilita que el jugador se pueda mover
	move_and_slide()
func correr():
	velocity.x = velocidad
	$AnimatedSprite2D.play("correr")
	await get_tree().create_timer(3.5,false).timeout
	if ganador==false:
		detener()
	else:
		_acercamiento()
	
func detener():
	#Pone la velocidad en 0 frenando al caballo
	velocity.x = 0
	#Asigna al sprite de parado
	$AnimatedSprite2D.play("idle")
	
func _acercamiento():
	var tween = create_tween()
	tween.tween_property(self, "position:y", mitad_y, 1.0)
	velocity.x = velocidad
	await get_tree().create_timer(4).timeout
	detener()

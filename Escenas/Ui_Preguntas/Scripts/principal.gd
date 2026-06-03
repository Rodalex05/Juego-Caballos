extends Control
# =====================================================
# CONECTAR ELEMENTOS DE LA INTERFAZ
# =====================================================
#Conectar Grids
@onready var pregunta_j1 = $Grid_Preguntas/PreguntasJ1
@onready var pregunta_j2 = $Grid_Preguntas/PreguntasJ2
@onready var curiosidad_j1 = $Rect_curiosidad1/Label
@onready var curiosidad_j2 = $Rect_curiosidad2/Label
#Conectar Hbox
@onready var grid_p1 = $HBoxContainer/Grid_J1
@onready var grid_p2 = $HBoxContainer/Grid_J2

# =====================================================
# ARRAY DE PREGUNTAS
# =====================================================
var preguntas = []
var pregunta_actual_j1 = {}
var pregunta_actual_j2 ={}
# =====================================================
# FUNCION READY
# =====================================================
func _ready():
	cargar_preguntas()
	nueva_pregunta_j1()
	nueva_pregunta_j2()
	add_to_group("principal_preguntas")

# =====================================================
# CARGAR CSV
# =====================================================

func cargar_preguntas():
	var archivo = FileAccess.open(
	"res://Escenas/Ui_Preguntas/Preguntas/Preguntas_Durango.csv",FileAccess.READ)
	# Saltar encabezado
	archivo.get_csv_line()
	while !archivo.eof_reached():
		var fila = archivo.get_csv_line()
		if fila.size() < 5:
			continue
		preguntas.append({
			"pregunta": fila[0],
			"correcta": fila[1],
			"incorrectas": [
				fila[2],
				fila[3],
				fila[4]],
				"curiosidad":fila[5]
			
})
# =====================================================
# NUEVA PREGUNTA J1
# =====================================================
func nueva_pregunta_j1():
	pregunta_actual_j1 = preguntas.pick_random()
	pregunta_j1.text = pregunta_actual_j1["pregunta"]
	grid_p1.configurar_pregunta(pregunta_actual_j1)
	curiosidadbox_j1()
# =====================================================
# NUEVA PREGUNTA J2
# =====================================================
func nueva_pregunta_j2():
	pregunta_actual_j2 = preguntas.pick_random()
	pregunta_j2.text = pregunta_actual_j2["pregunta"]
	grid_p2.configurar_pregunta(pregunta_actual_j2)
	curiosidadbox_j2()
	
func curiosidadbox_j1():
	curiosidad_j1.text = pregunta_actual_j1["curiosidad"]
func curiosidadbox_j2():
	curiosidad_j2.text = pregunta_actual_j2["curiosidad"]
	

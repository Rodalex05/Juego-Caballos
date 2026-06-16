extends Control
# =====================================================
# CONECTAR ELEMENTOS DE LA INTERFAZ
# =====================================================
#Conectar Grids
@onready var pregunta_j1 = $Grid_Preguntas/PreguntasJ1
@onready var curiosidad_j1 = $Rect_curiosidad1/Label
#Conectar Hbox
@onready var grid_p1 = $HBoxContainer/Grid_J1

# =====================================================
# ARRAY DE PREGUNTAS
# =====================================================
var preguntas = []
var pregunta_actual_j1 = {}
# =====================================================
# FUNCION READY
# =====================================================
func _ready():
	cargar_preguntas()
	nueva_pregunta_j1()
	add_to_group("principal_preguntas")

# =====================================================
# CARGAR CSV
# =====================================================

func cargar_preguntas():
	var archivo=""
	if Fondos.Fondo_jugar == 0:
		archivo = FileAccess.open(
	"res://Escenas/Ui_Preguntas/Preguntas/Preguntas_Zacatecas.csv",FileAccess.READ)
		print("Zacatecas")
	elif Fondos.Fondo_jugar == 1:
		archivo = FileAccess.open(
	"res://Escenas/Ui_Preguntas/Preguntas/Preguntas_Durango.csv",FileAccess.READ)
		print("Durango")
	if Fondos.Fondo_jugar == 2:
		archivo = FileAccess.open(
	"res://Escenas/Ui_Preguntas/Preguntas/Preguntas_Cohauila.csv",FileAccess.READ)
		print("Coahuila")
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
	GlobalPreguntas.GlobalPreguntasJ1.append(pregunta_actual_j1["pregunta"])
	pregunta_j1.text = pregunta_actual_j1["pregunta"]
	grid_p1.configurar_pregunta(pregunta_actual_j1)
	curiosidadbox_j1()
	
func curiosidadbox_j1():
	curiosidad_j1.text = pregunta_actual_j1["curiosidad"]

	

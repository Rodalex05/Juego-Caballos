extends Control
# =====================================================
# CONECTAR ELEMENTOS DE LA INTERFAZ
# =====================================================
#Conectar Grids
@onready var pregunta_j1 = $Grid_Preguntas/PreguntasJ1
@onready var pregunta_j2 = $Grid_Preguntas/PreguntasJ2
#Conectar Hbox
@onready var grid_p1 = $HBoxContainer/Grid_J1
@onready var grid_p2 = $HBoxContainer/Grid_J2

# =====================================================
# ARRAY DE PREGUNTAS
# =====================================================
var preguntas = []

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
	"res://Escenas/Ui_Preguntas/Preguntas/Pregtest.csv",FileAccess.READ)
		#Debug
	if archivo == null:
		print(FileAccess.file_exists("res://Escenas/Ui_Preguntas/Preguntas/Pregtest.csv"))
		print("NO SE PUDO ABRIR EL CSV")
		return
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
				fila[4]
			]
})
# =====================================================
# NUEVA PREGUNTA J1
# =====================================================
func nueva_pregunta_j1():
	var pregunta = preguntas.pick_random()
	pregunta_j1.text = pregunta["pregunta"]
	grid_p1.configurar_pregunta(pregunta)
	
# =====================================================
# NUEVA PREGUNTA J2
# =====================================================
func nueva_pregunta_j2():
	var pregunta = preguntas.pick_random()
	pregunta_j2.text = pregunta["pregunta"]
	grid_p2.configurar_pregunta(pregunta)

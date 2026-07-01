extends RichTextLabel

func _ready():
	meta_clicked.connect(_on_meta_clicked)

	var archivo = FileAccess.open("res://Creditos.txt", FileAccess.READ)

	if archivo == null:
		text = "No se pudo abrir el archivo."
		return

	text = archivo.get_as_text()

func _on_meta_clicked(meta):
	OS.shell_open(str(meta))

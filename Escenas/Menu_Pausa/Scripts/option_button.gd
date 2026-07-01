extends OptionButton
var resolucion=0
func _ready() -> void:
	selected=Cursor.Resolucion
#guardar las dimensiones disponibles
func _on_item_selected(index: int) -> void:
	match index:
		0:
			_apply_resolution(Vector2i(1920, 1080))
			$"../Check_Pantalla".button_pressed = false
			Cursor.Resolucion=0
			$"../Check_Pantalla"._Pantalla()
		1:
			_apply_resolution(Vector2i(1600, 900))
			$"../Check_Pantalla".button_pressed = false
			Cursor.Resolucion=1
			$"../Check_Pantalla"._Pantalla()
		2:
			_apply_resolution(Vector2i(1280, 720))
			$"../Check_Pantalla".button_pressed = false
			Cursor.Resolucion=2
			$"../Check_Pantalla"._Pantalla()
		3:
			_apply_resolution(Vector2i(1024, 768))
			$"../Check_Pantalla".button_pressed = false
			Cursor.Resolucion=3
			$"../Check_Pantalla"._Pantalla()
		4:
			_apply_resolution(Vector2i(800, 600))
			$"../Check_Pantalla".button_pressed = false
			Cursor.Resolucion=4
			$"../Check_Pantalla"._Pantalla()
	
#aplica la resolucion seleccionada
func _apply_resolution(size: Vector2i) -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	DisplayServer.window_set_size(size)
#Pone la ventana en medio de la pantalla
	DisplayServer.window_set_position(
		DisplayServer.screen_get_position() +
		(DisplayServer.screen_get_size() - size) / 2
	)

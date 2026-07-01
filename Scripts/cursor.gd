extends Node
var Fullscreen=false
var Resolucion=0
func _ready():
	var cursor = load("res://sprites/Cursor/Normal-Select.png")
	Input.set_custom_mouse_cursor(cursor, Input.CURSOR_ARROW, Vector2(0, 0))
	

extends GridContainer


func _ready():

	$W.pressed.connect(_q)
	$A.pressed.connect(_a)
	$S.pressed.connect(_s)
	$D.pressed.connect(_d)



func _q():
	Input.action_press("Boton1A")
	Input.action_release("Boton1A")


func _d():
	Input.action_press("Boton1B")
	Input.action_release("Boton1B")


func _s():
	Input.action_press("Boton1C")
	Input.action_release("Boton1C")


func _a():
	Input.action_press("Boton1D")
	Input.action_release("Boton1D")

extends VBoxContainer
#======CREDITOS DEL JUEGO======
func _ready():
	#Pone los creditos por debajo de la escena 
	self.position.y=1100
func _process(delta):
	#Mueve los creditos hacia arriba lentamente
	position.y -= 100 * delta

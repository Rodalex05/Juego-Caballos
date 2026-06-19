extends VBoxContainer

func _ready():
	self.position.y=2600
	var creditostxt = FileAccess.open("res://Creditos.txt", FileAccess.READ)
	$Creditos.text=creditostxt.get_as_text()
func _process(delta):
	position.y -= 100 * delta

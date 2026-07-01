extends Control
@export var sfx_pausa : AudioStreamPlayer
var pausado=false
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("BtnPausa") and pausado==false:
		
		position.y-=1000
		sfx_pausa.play()
		_pausa()
	
func _pausa():
	get_tree().paused = true
	pausado=true
	$"../ColorRect2".visible=true

func _volver():
	get_tree().paused=false
	pausado=false
	$"../ColorRect2".visible=false

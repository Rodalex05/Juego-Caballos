extends Label
#======VARIABLES======
var inicio : int
var contando := false

func _process(_delta):
	#Funcion cuando el cronometro esta desactivado
	if contando==false:
		return
	var tiempo_ms = Time.get_ticks_msec() - inicio
	var minutos = tiempo_ms / 60000
	var segundos = (tiempo_ms % 60000) / 1000
	var milisegundos = tiempo_ms % 1000
	text = "%02d:%02d.%03d" % [minutos, segundos, milisegundos]

#======INICIO DEL CRONOMETRO======
func iniciar_cronometro():
	inicio = Time.get_ticks_msec()
	contando = true

#======DETIENE EL TIEMPO======
func detener_cronometro():
	contando = false
	GlobalTiempo.tiempo = text
	
	

extends CanvasLayer

@export var timer: Timer
@export var label_plus_seconds: Label 
@export var timer_plus_seconds: Timer 


func _ready() -> void:
	Globals.score = 0
	label_plus_seconds.visible = false

func add_time(): # adds time to the timer and then keeps going
	var time_left = timer.time_left
	timer.stop()
	timer.wait_time = time_left + Globals.add_time
	label_plus_seconds.text = '+{num} secs!'.format({"num": Globals.add_time})
	timer.start()
	# shows label add time
	label_plus_seconds.visible = true
	timer_plus_seconds.start()

func _on_timer_plus_seconds_timeout() -> void:
	label_plus_seconds.visible = false

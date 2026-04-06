extends CanvasLayer

@export var timer: Timer

func add_time(time): # adds time to the timer and then keeps going
	var time_left = timer.time_left
	timer.stop()
	timer.wait_time = time_left + time
	timer.start()

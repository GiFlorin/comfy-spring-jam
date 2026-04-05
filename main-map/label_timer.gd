extends Label

@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = 60
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = 'time: ' + str("%.1f" % timer.time_left)

func _on_timer_timeout() -> void:
	pass # Replace with function body.

extends Label

@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = 60
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = 'Time: ' + str("%.1f" % timer.time_left)

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file('res://UI scenes/end_day_scene/end_day_scene.tscn')

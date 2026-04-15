extends Label

@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = Globals.game_len
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = 'time: ' + str("%.1f" % timer.time_left)

func _on_timer_timeout() -> void:
	if Globals.game_mode == 'normal':
		if Globals.score >= Globals.deliver_goal: # if you have won
			get_tree().change_scene_to_file('res://UI scenes/win_screen/win_screen.tscn')
		else: # if you haven't won
			get_tree().change_scene_to_file('res://UI scenes/game_over_screen/game_over_screen.tscn')
	elif Globals.game_mode == 'endless': 
		get_tree().change_scene_to_file('res://UI scenes/end_day_scene/end_day_scene.tscn')

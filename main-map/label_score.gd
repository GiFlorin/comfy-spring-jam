extends Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Globals.game_mode == 'endless':
		text = str(Globals.score)
	elif Globals.game_mode == 'normal':
		text = str(Globals.score) + '/' + str(Globals.deliver_goal)

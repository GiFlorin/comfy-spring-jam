extends Button

func _on_button_down() -> void:
	Globals.destinations_complete = false
	Globals.score = 0 
	if Globals.game_mode == "normal":
		Globals.game_mode = "normal"
	elif Globals.game_mode == "endless":
		Globals.game_mode = "endless"
	Globals.set_data()
	get_tree().change_scene_to_file('res://main-map/main_world.tscn')

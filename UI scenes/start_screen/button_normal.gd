extends Button
@onready var select_sound: AudioStreamPlayer2D = $"../SelectSound"

func _on_button_down() -> void:
	Globals.destinations_complete = false
	Globals.score = 0 
	
	Globals.game_mode = "normal"
	Globals.set_data()
	
	select_sound.play()
	await get_tree().create_timer(0.65).timeout
	
	if Globals.bunny_name == '':
		get_tree().change_scene_to_file('res://UI scenes/ask_name/ask_name.tscn')
	else:
		get_tree().change_scene_to_file('res://main-map/main_world.tscn')

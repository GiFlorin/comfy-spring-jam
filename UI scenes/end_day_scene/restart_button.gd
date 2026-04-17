extends Button

func _on_button_down() -> void:
	Globals.set_data()
	get_tree().change_scene_to_file('res://main-map/main_world.tscn')

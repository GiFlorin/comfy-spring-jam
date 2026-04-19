extends Button
@onready var select_sound: AudioStreamPlayer2D = $"../SelectSound"

func _on_button_down() -> void:
	select_sound.play()
	await get_tree().create_timer(0.65).timeout
	get_tree().change_scene_to_file("res://UI scenes/start_screen/start_screen.tscn")

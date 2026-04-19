extends Node2D
@onready var main_map_music: AudioStreamPlayer2D = $MainMapMusic
@onready var main_menu_music: AudioStreamPlayer2D = $MainMenuMusic


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func play_main_menu_music() -> void:
	main_menu_music.play()
	pass

func stop_all_music() -> void:
	main_menu_music.stop()
	#main_map_music.stop()
	pass

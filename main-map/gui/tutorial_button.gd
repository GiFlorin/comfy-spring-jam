extends Button
@onready var tutorials: Control = $"../tutorials"

func _ready():
	if Globals.tutorial_done == false:
		get_tree().paused = true
		tutorials.visible = true
	else:
		tutorials.visible = false


func _on_button_down() -> void:
	get_tree().paused = true
	tutorials.visible = true
	tutorials.restart()

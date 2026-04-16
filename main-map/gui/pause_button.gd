extends Button

@onready var pause_overlay: Control = $pause_overlay

func _ready() -> void:
	Globals.is_paused = false
	pause_overlay.visible = false

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed('pause'):
		toggle_pause()

func _on_button_down() -> void:
	toggle_pause()

func toggle_pause():
	# unpauses
	if Globals.is_paused == true:
		Globals.is_paused = false
		pause_overlay.visible = false
		get_tree().paused = false
	# pauses
	else:
		Globals.is_paused = true
		pause_overlay.visible = true
		get_tree().paused = true

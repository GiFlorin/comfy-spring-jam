extends Node2D
@onready var select_sound: AudioStreamPlayer2D = $SelectSound

@onready var text_edit: TextEdit = $TextEdit
@onready var button: Button = $Button

func _ready() -> void:
	text_edit.gui_input.connect(_on_text_input)

func _on_button_pressed() -> void:
	submitname()

func _on_text_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.keycode == KEY_ENTER:
		submitname()

func submitname() -> void:
	Globals.bunny_name = text_edit.text
	get_tree().change_scene_to_file('res://main-map/main_world.tscn')

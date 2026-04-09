extends Node2D

@onready var text_edit: TextEdit = $TextEdit
@onready var button: Button = $Button

func _on_button_pressed() -> void:
	Globals.bunny_name = text_edit.text
	get_tree().change_scene_to_file('res://main-map/main_world.tscn')

extends Control

@onready var previous_button: Button = $HBoxContainer/previous_button
@onready var close_button: Button = $HBoxContainer/close_button
@onready var next_button: Button = $HBoxContainer/next_button
@onready var window: Panel = $tutorial_window
@onready var pages: Control = $tutorial_window/pages

func restart():
	pages.cur_page_index = 0
	pages.change_page(0)
	update_buttons()

func update_buttons():
	# if it's in the first page, there is no previous page
	if pages.cur_page_index == 0:
		previous_button.visible = false
	else:
		previous_button.visible = true
	
	# if it's in the last page, there's no next page
	if pages.cur_page_index == len(pages.cur_trail)-1:
		next_button.visible = false
	else:
		next_button.visible = true

func _ready():
	MusicManager.stop_all_music()
	update_buttons()
	

func _on_previous_button_button_down() -> void:
	pages.change_page(-1)
	update_buttons()

func _on_next_button_button_down() -> void:
	pages.change_page(1)
	update_buttons()

func _on_close_button_button_down() -> void:
	get_tree().paused = false
	self.visible = false
	Globals.tutorial_done = true

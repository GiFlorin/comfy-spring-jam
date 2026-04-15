extends Node2D

@onready var text_bubbles: Node2D = $text_bubbles
@onready var speech_text: Label = $speech_text

var text_bubbles_list: Array

func _ready():
	text_bubbles_list = text_bubbles.get_children()
	self.visible = false

func speak():
	self.visible = true
	for child in text_bubbles_list:
		child.visible = false
	text_bubbles_list.pick_random().visible = true
	speech_text.write()

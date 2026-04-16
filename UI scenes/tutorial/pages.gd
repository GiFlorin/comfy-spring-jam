extends Control

@onready var cover_page: Control = $cover_page
@onready var page_1: Control = $page_1
@onready var page_2_normal: Control = $page_2_normal
@onready var page_2_endless: Control = $page_2_endless
@onready var page_3: Control = $page_3
@onready var progress_counter: Label = $"../overlay/progress_counter"

var cur_page_index = 0

var normal_trail: Array
var endless_trail: Array
var cur_trail : Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	normal_trail = [cover_page, page_1, page_2_normal, page_3]
	endless_trail = [cover_page, page_1, page_2_endless, page_3]
	
	if Globals.game_mode == 'normal':
		cur_trail = normal_trail
	elif Globals.game_mode == 'endless':
		cur_trail = endless_trail
	change_page(0)

func change_page(val:int):
	for child in get_children():
		child.visible = false
	
	if val > 0 and cur_page_index < len(cur_trail)-1:
		cur_page_index += val
	elif val < 0 and cur_page_index > 0:
		cur_page_index += val
	var cur_page = cur_trail[cur_page_index]
	cur_page.visible = true
	var progress: int = (float(cur_page_index) / (len(cur_trail)-1))*100
	progress_counter.text = str(progress) + '%'

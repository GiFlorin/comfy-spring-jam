extends Node

var destination_x: int
var destination_y: int
var score:int
var high_score = 0
var bunny_name = ''
var destinations_complete = false
var game_len: int
var deliver_goal: int
var add_time: int
var is_paused = false
var tutorial_done = false

# normal, endless
var game_mode: String = 'normal'

func set_data() -> void:
	if game_mode == 'normal':
		game_len = 90
		deliver_goal = 12
		add_time = 5
	elif game_mode == 'endless':
		game_len = 60
		add_time = 10

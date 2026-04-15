extends Node

var destination_x: int
var destination_y: int
var score = 0
var high_score = 0
var bunny_name = ''
var destinations_complete = false
var game_len: int
var deliver_goal: int

# normal, endless
var game_mode: String = 'normal'

func _enter_tree() -> void:
	if game_mode == 'normal':
		game_len = 90
		deliver_goal = 12
	elif game_mode == 'endless':
		game_len = 180

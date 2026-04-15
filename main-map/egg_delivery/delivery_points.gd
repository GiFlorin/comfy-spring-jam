extends Node2D

@onready var gui: CanvasLayer = $"../../GUI"


var destination_x: int
var destination_y: int
var destinations: Array
var cur_destination = null
var used_destinations_index = []

func _ready() -> void:
	destinations = get_children()
	new_destination()

func new_destination(): # changes the destination to another random one
	var n = randi_range(0, len(destinations) - 1)
	# if all the destinations are used, restarts
	if len(destinations) == len(used_destinations_index):
		used_destinations_index = []
		
	# if the goal is met -> normal mode
	if Globals.game_mode == 'normal' and Globals.score >= Globals.deliver_goal:
		destination_x = 0
		destination_y = 0
		Globals.destinations_complete = true
		get_tree().change_scene_to_file('res://UI scenes/end_day_scene/end_day_scene.tscn')
	# if the point has already been complete, it runs again
	elif used_destinations_index.has(n):
		new_destination()
	# changes the destination
	else:
		cur_destination = destinations[n]
		Globals.destination_x = cur_destination.global_position.x
		Globals.destination_y = cur_destination.global_position.y
		used_destinations_index.append(n)
		gui.add_time(5)

# when the egg has been delivered, it changes the destination
func _on_egg_item_new_destination() -> void:
	new_destination()
	

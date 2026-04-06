extends Node

var destination_x: int
var destination_y: int
var destinations: Array
var cur_destination = null
var used_destinations_index = []

func _ready() -> void:
	for child in get_children():
		pass
	destinations = get_children()
	new_destination()

func new_destination():
	var n = randi_range(0, len(destinations) - 1)
	if len(destinations) == len(used_destinations_index):
		print('all complete!')
		destination_x = 0
		destination_y = 0
		Globals.destinations_complete = true
	elif used_destinations_index.has(n):
		new_destination()
	else:
		cur_destination = destinations[n]
		Globals.destination_x = cur_destination.global_position.x
		Globals.destination_y = cur_destination.global_position.y
		used_destinations_index.append(n)

func _on_egg_item_new_destination() -> void:
	new_destination()

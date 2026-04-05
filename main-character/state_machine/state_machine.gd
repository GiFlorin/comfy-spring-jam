extends Node

@export var idle: State
@export var walk: State
@export var sprint: State

@export 
var starting_state: State
var current_state: State
var velocity

# Initialize the state machine by giving each child state a reference to the
# parent object it belongs to and enter the default starting_state.
func init(parent: Player) -> void:
	for child in get_children():
		child.parent = parent
	
	# Initialize to the default state
	change_state(starting_state)

# Change to the new state by first calling any exit logic on the current state.
func change_state(new_state: State) -> void:
	if current_state:
		current_state.exit()
	
	current_state = new_state
	current_state.enter()

# Pass through functions for the Player to call,
# handling state changes as needed.
func process_physics(delta: float) -> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)

# selects the state
func process_input(_event: InputEvent) -> void:
	var new_state = null
	if Input.is_action_pressed('move_down') or Input.is_action_pressed('move_up') or Input.is_action_pressed('move_right') or Input.is_action_pressed('move_left'):
		if Input.is_action_pressed('sprint'):
			new_state = sprint
		else: 
			new_state = walk
	else: new_state = idle
	
	if new_state:
		change_state(new_state)

func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)

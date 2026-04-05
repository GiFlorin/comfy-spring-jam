extends State

@export var idle: State
@export var sprint: State
var vel_x = 0
var vel_y = 0

func enter() -> void:
	super()
	

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed('move_down') or Input.is_action_just_pressed('move_up') or Input.is_action_just_pressed('move_right') or Input.is_action_just_pressed('move_left'):
		if Input.is_action_just_pressed('sprint'):
			return sprint
	return null

func process_frame(delta: float) -> State:
	return null

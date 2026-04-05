extends State

@export var idle: State
@export var sprint: State
var vel_x = 0
var vel_y = 0

func enter() -> void:
	super()
	

func process_frame(delta: float) -> State:
	if Input.is_action_pressed('move_left'):
		parent.animations.flip_h = true
	else:
		parent.animations.flip_h = false
	return null

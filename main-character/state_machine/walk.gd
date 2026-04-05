extends State

@export var idle: State
@export var sprint: State
var vel_x = 0
var vel_y = 0

func enter() -> void:
	super()

func process_frame(delta: float) -> State:
	parent.animations.play(animation_name)
	if parent.input_direction.y == -1:
		animation_name = 'walk_up'
		parent.animations.flip_h = false
	elif parent.input_direction.y == 1:
		animation_name = 'walk_down'
		parent.animations.flip_h = false
	if parent.input_direction.x == -1:
		animation_name = 'walk_side'
		parent.animations.flip_h = true
	elif parent.input_direction.x == 1:
		animation_name = 'walk_side'
		parent.animations.flip_h = false
	return null

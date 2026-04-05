extends State

@export var idle: State
@export var sprint: State
var vel_x = 0
var vel_y = 0

func enter() -> void:
	super()

func process_frame(delta: float) -> State:
	parent.animations.play(animation_name)
	if parent.input_direction:
		animation_name = 'walk_up'
		parent.animations.flip_h = false
	if Input.is_action_just_pressed("move_down"):
		animation_name = 'walk_down'
		parent.animations.flip_h = false
	if Input.is_action_pressed("move_left"):
		animation_name = 'walk_side'
		parent.animations.flip_h = true
	if Input.is_action_pressed('move_right'):
		animation_name = 'walk_side'
		parent.animations.flip_h = false
	return null

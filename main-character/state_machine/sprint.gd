extends State

func enter() -> void:
	super()

func process_frame(_delta: float) -> State:
	if Input.is_action_pressed('move_left'):
		parent.animations.flip_h = true
	else:
		parent.animations.flip_h = false
	return null

extends State

func enter() -> void:
	super()

func process_frame(_delta: float) -> State:
	parent.animations.play(animation_name)
	# sort out the animations for sprinting
	if parent.input_direction.y == 1:
		animation_name = 'sprint_down'
		parent.animations.flip_h = false
	elif parent.input_direction.y == -1:
		animation_name = 'sprint_up'
		parent.animations.flip_h = false
	if parent.input_direction.x == -1:
		animation_name = 'sprint_side'
		parent.animations.flip_h = true
	if parent.input_direction.x == 1:
		animation_name = 'sprint_side'
		parent.animations.flip_h = false
	return null

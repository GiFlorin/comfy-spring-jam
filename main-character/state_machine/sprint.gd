extends State

func enter() -> void:
	parent.trail_particles.speed_scale = 1.3
	super()

func process_frame(_delta: float) -> State:
	parent.animations.play(animation_name)
	# sort out the animations for sprinting
	if parent.input_direction.y == 1:
		animation_name = 'sprint_down'
	elif parent.input_direction.y == -1:
		animation_name = 'sprint_up'
	if parent.input_direction.x == -1:
		animation_name = 'sprint_left'
	if parent.input_direction.x == 1:
		animation_name = 'sprint_right'
	return null

extends State

func enter() -> void:
	super()
	parent.velocity.x = 0
	parent.velocity.y = 0
	parent.trail_particles.speed_scale = 0.1

func process_frame(_delta: float) -> State:
	parent.animations.play(animation_name)
	if parent.facing_direction == 'down':
		animation_name = 'idle_front'
	elif parent.facing_direction == 'up':
		animation_name = 'idle_back'
	if parent.facing_direction == 'right':
		animation_name = 'idle_right'
	elif parent.facing_direction == 'left':
		animation_name = 'idle_left'
	return null

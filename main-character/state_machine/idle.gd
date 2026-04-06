extends State

func enter() -> void:
	super()
	parent.velocity.x = 0
	parent.velocity.y = 0
	parent.trail_particles.speed_scale = 0.1

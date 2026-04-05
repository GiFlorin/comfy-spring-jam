extends State

func enter() -> void:
	super()

func process_frame(_delta: float) -> State:
	parent.animations.play(animation_name)
	if Input.is_action_just_pressed("move_down"):
		animation_name = 'sprint_down'
		parent.animations.flip_h = false
	if Input.is_action_pressed("move_left"):
		animation_name = 'sprint_side'
		parent.animations.flip_h = true
	if Input.is_action_pressed('move_right'):
		animation_name = 'sprint_side'
		parent.animations.flip_h = false
	if Input.is_action_pressed("move_up"):
		animation_name = 'sprint_up'
		parent.animations.flip_h = false
	return null

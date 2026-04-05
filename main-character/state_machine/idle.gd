extends State

@export var walk_side: State


func enter() -> void:
	super()
	parent.velocity.x = 0
	parent.velocity.y = 0

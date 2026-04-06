extends Area2D

@onready var glow: PointLight2D = $glow

var max_glow = 1000
signal new_destination

func get_distance() -> float:
	if Globals.destinations_complete == false:
		var ca = (global_position.x - Globals.destination_x) ** 2
		var co = (global_position.y - Globals.destination_y) ** 2
		var h = (ca + co) ** 0.5
		return h
	else:
		return 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	glow.energy = max_glow/get_distance()

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed('interaction'):
		if Globals.destinations_complete == false:
			if get_distance() < 55:
				Globals.score += 1
				new_destination.emit()

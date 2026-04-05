extends Area2D

@onready var glow: PointLight2D = $glow

func get_distance() -> float:
	var diagonal_map = 1000
	var ca = (global_position.x - Autoload.destination_x) ** 2
	var co = (global_position.y - Autoload.destination_y) ** 2
	var h = (ca + co) ** 0.5
	return diagonal_map/h

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	glow.energy = get_distance()

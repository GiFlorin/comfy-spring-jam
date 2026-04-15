extends Area2D

@onready var main_character: Player = $"../../level/main_character"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body):
	if body.is_in_group("player"):
		#top: y=-520.0
		#bottom: y=1272.0
		main_character.global_position.x += 2660
		print("COLLSION WITH LEFT!")
		
		
	pass

func _on_body_exited(body):
	if body.is_in_group("player"):
		pass

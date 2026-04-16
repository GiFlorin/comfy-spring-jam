extends Area2D

@onready var collision_shape: CollisionShape2D = $CollisionShape
@onready var interaction_icon: AnimatedSprite2D = $interaction_icon
@onready var speech: Node2D = $"../speech"


var player_entered := false
var is_talking := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_icon.visible = false
	self.visible = true

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("interaction"):
		if player_entered == true and is_talking == false:
			speech.speak()
			is_talking = true
			interaction_icon.visible = false

func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("player"):
		player_entered = true
		interaction_icon.visible = true

func _on_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("player"):
		player_entered = false
		interaction_icon.visible = false
		speech.visible = false
		is_talking = false

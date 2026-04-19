extends Button
@onready var credits_list: Label = $"../Credits_List"

var credit_visibility: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	credits_list.visible = false
	credit_visibility = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_down() -> void:
	if credit_visibility == true:
		credits_list.visible = false
		credit_visibility = false
	else:
		credits_list.visible = true
		credit_visibility = true
	pass

extends Node2D

@onready var label: Label = $Label
@onready var label_score: Label = $Label_score
@onready var label_hscore: Label = $Label_hscore
@onready var label_new_high_score: Label = $Label_new_high_score

func _ready() -> void:
	if Globals.score > Globals.high_score:
		label_new_high_score.visible = true
		Globals.high_score = Globals.score
	else:
		label_new_high_score.visible = false
	label.text = Globals.bunny_name + '\'s day has ended!'
	label_score.text = 'Your score was: '+ str(Globals.score)
	label_hscore.text = 'Your high score is: '+ str(Globals.high_score)

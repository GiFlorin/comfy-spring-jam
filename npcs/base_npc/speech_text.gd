extends Label

var speech_texts = [
	'I\'m sooooooo exited for easter day(today) hahaha',
	'Hello There neighbour, how are you today?',
	'These eggs look beautiful, did you decorate them yourself?',
	'Hurry along, the sunshine melts chocolate faster than you think!',
	'The wind’s picking up, hold tight to those baskets!'
]

func write():
	text = speech_texts.pick_random()

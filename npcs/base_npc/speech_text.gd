extends Label

var speech_texts = [
	'I\'m sooooooo exited for easter day(today) hahaha',
	'Hello There neighbour, how are you today?',
	'These eggs look beautiful, did you decorate them yourself?',
	'Hurry along, the sunshine melts chocolate faster than you think!',
	'The wind’s picking up, hold tight to those baskets!',
	'The flowers are blooming early this year, isn’t that nice?',
	'The breeze today feels gentle, like a quiet little hug.',
	'I just baked something sweet, the smell filled the house.',
	'I lost track of time reading by the window again.',
	'I always forget how nice fresh air feels in spring.',
	'The path near the trees is my favorite place to walk.',
	'Neighbors make everything better, don’t you think so too?',
	'I saw you running earlier, always so full of energy!',
	'Lovely weather today, perfect for a peaceful afternoon stroll.',
	'Did you hear the birds this morning? They sounded cheerful.',
	'Sometimes I just sit outside and watch the clouds drift.',
	'Careful hopping, some eggs crack if you rush too much!',
	'Easter is my favourite day of the whole year!',
	'I could eat chocolate for every meal of the day'
]

func write():
	text = speech_texts.pick_random()

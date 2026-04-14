extends Area2D

@onready var glow: PointLight2D = $sprite/glow
@onready var deliver_particles: CPUParticles2D = $deliver_particles
@onready var egg_collect_audio: AudioStreamPlayer2D = $egg_collect_Audio
@onready var _10_egg_collect_audio: AudioStreamPlayer2D = $"10_egg_collect_audio"
@onready var egg_sprite: Sprite2D = $sprite


var max_glow = 2500
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
			if get_distance() < 90:
				Globals.score += 1
				deliver_particles.emitting = true
				if Globals.score % 10 == 0:
					_10_egg_collect_audio.play()
				else:
					egg_collect_audio.play()
					var random_int = randi_range(1, 16)
					egg_sprite.frame = random_int - 1
				new_destination.emit()

class_name npc
extends CharacterBody2D

@onready var ray: RayCast2D = $ray
@onready var sprites: AnimatedSprite2D = $sprites
@onready var timer: Timer = $Timer

const MAX_DIRECTION_RETRIES = 10
const SPEED = 75.0
var is_occupied = false
var directions: Array = ['right', 'left','up', 'down', 'stay']
var cur_direction: String
var new_position: Vector2

func set_animation():
	if is_occupied == false or cur_direction == 'stay':
		sprites.play("idle")
	elif cur_direction == 'right':
		sprites.play("walking_right")
	elif cur_direction == 'left':
		sprites.play("walking_left")
	elif cur_direction == 'up':
		sprites.play("walking_up")
	elif cur_direction == 'down':
		sprites.play("walking_down")

func set_direction():
	for i in MAX_DIRECTION_RETRIES:
		# chooses the direction randomly
		var candidate = directions.pick_random()
		# if it chooses stay
		if candidate == 'stay':
			wait()
			return
		else:
			var n = randf_range(2, 5) # how much the npc will walk
			# sets the ray length
			match candidate:
				'right': ray.target_position = Vector2(SPEED * 2, 0)
				'left': ray.target_position = Vector2(-SPEED * 2, 0)
				'up': ray.target_position = Vector2(0, -SPEED * 2)
				'down': ray.target_position = Vector2(0, SPEED * 2)
			
			ray.force_raycast_update() # updates the raycast
			# if the ray is colliding, randomize the direction again
			if not ray.is_colliding():
				# sets the velocity based on the direction
				cur_direction = candidate
				match cur_direction:
					'right':
						velocity.x = SPEED
						velocity.y = 0
						new_position.x = global_position.x + (SPEED * n)
					'left':
						velocity.x = SPEED * -1
						velocity.y = 0
						new_position.x = global_position.x - (SPEED * n)
					'up':
						velocity.x = 0
						velocity.y = SPEED * -1
						new_position.y = global_position.y - (SPEED * n)
					'down':
						velocity.x = 0
						velocity.y = SPEED
						new_position.y = global_position.y + (SPEED * n)
				is_occupied = true
				return
	wait()

func wait():
	cur_direction = 'stay'
	timer.wait_time = randi_range(1, 3)
	velocity.x = 0
	velocity.y = 0
	is_occupied = true
	timer.start()

func _on_timer_timeout() -> void:
	is_occupied = false
	set_direction()
	set_animation()

func _ready() -> void:
	new_position = global_position
	wait()

func _physics_process(delta: float) -> void:
	if global_position.distance_to(new_position) < 3 and cur_direction != 'stay':
		wait()
	
	if is_occupied:
		move_and_slide()

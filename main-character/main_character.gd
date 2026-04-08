class_name Player
extends CharacterBody2D

@onready var animations: AnimatedSprite2D = $Animations
@onready var state_machine: Node = $state_machine
@onready var trail_particles: CPUParticles2D = $trail_particles


var input_direction: Vector2
var facing_direction: String

func _ready() -> void:
	# initialize the state machine, passing a reference of the player to the states
	# that way they can move and react accordingly
	state_machine.init(self)
	pass

func get_input():
	input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * state_machine.current_state.move_speed

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	get_input()
	move_and_slide()

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

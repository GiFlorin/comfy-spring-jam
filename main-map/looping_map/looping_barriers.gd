extends Node2D

@export var player_node: CharacterBody2D
@export var camera: Camera2D

@onready var top: Area2D = $top
@onready var right: Area2D = $right
@onready var bottom: Area2D = $bottom
@onready var left: Area2D = $left

func _on_top_body_entered(body: Node2D) -> void:
	if body == player_node:
		camera.position_smoothing_enabled = false
		player_node.global_position.y = bottom.global_position.y
		camera.global_position.y = bottom.global_position.y
		camera.position_smoothing_enabled = false

func _on_right_body_entered(body: Node2D) -> void:
	if body == player_node:
		camera.position_smoothing_enabled = false
		player_node.global_position.x = left.global_position.x
		camera.global_position.x = left.global_position.x
		camera.position_smoothing_enabled = false

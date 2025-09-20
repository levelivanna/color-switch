class_name Obstacle
extends Node2D
@export var min_rotation_speed: float = 60.0 
@export var max_rotation_speed: float = 80.0
var rotation_speed: float = 0.0
@export var destroy_distance: float = 800
@export var star_scene: PackedScene
var _rotation_direction = [1, -1]

var rng = RandomNumberGenerator.new()

var player: CharacterBody2D

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	rotation_degrees += rotation_speed * delta
	if _can_destroy_self():
		destroy()

func destroy():
	queue_free()
	
func set_player(body: CharacterBody2D):
	player = body

func _can_destroy_self() -> bool:
	if not player:
		return false
	var distance = global_position.y - player.global_position.y
	return distance > destroy_distance

func set_random_rotation():
	var direction  = _rotation_direction.pick_random()
	rotation_speed = rng.randf_range(min_rotation_speed, max_rotation_speed) * direction

class_name Obstacle
extends Node2D
@export var min_rotation_speed: float = 60.0 
@export var max_rotation_speed: float = 80.0
var rotation_speed: float = 0.0
@export var destroy_distance: float = 800
var star_scene: PackedScene = GLOBALS.STAR_SCENE
var circle_color_scene: PackedScene = GLOBALS.CIRCLE_COLOR_SCENE
var circle_color: Node
var star: Node
var _rotation_direction = [1, -1]
var _generate_circle_color_percentege = 0.5

var rng = RandomNumberGenerator.new()
var can_generate_circle_color: bool = false
var player: CharacterBody2D

func _ready() -> void:
	star = star_scene.instantiate()
	star.position = global_position
	get_tree().current_scene.add_child(star)
	var rand = randf()
	can_generate_circle_color = rand < _generate_circle_color_percentege
	circle_color = circle_color_scene.instantiate()
	circle_color.position = global_position
	

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

func set_star_position():
	if not star:
		return
	star.position = global_position
	
func set_circle_color_position():
	if not circle_color || !can_generate_circle_color:
		return
	get_tree().current_scene.add_child(circle_color)
	circle_color.global_position = Vector2(global_position.x, global_position.y + 150)

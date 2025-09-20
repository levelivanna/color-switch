extends Node2D
@export var player: Node2D
@export var obstacles_scenes: Array[PackedScene]
@export var spawn_distance: float = 0.0
@export var max_obstacles: int = 5
var obstacle_distance: float = 300.0
var last_obstacle_position_y = 0



var viewport_size_x = 0.0
var viewport_size_y = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	viewport_size_x = get_viewport().size.x
	viewport_size_y = get_viewport().size.y
	spawn_distance = viewport_size_y * 1.5
	_set_first_obstacles()
	

func _process(delta: float) -> void:
	_process_spawner()
	
func _set_first_obstacles():
	if not player:
		return
	last_obstacle_position_y = viewport_size_y - obstacle_distance
	_spawn_obstacle(last_obstacle_position_y)

	
func _filter_obstacle_child(child):
	return child.is_in_group('obstacle')
	
func _process_spawner():
	var children = get_children()
	var obstacles_size = children.filter(_filter_obstacle_child).size()
	if not player:
		return
	if obstacles_size >= max_obstacles:
		return
	if player.global_position.y < spawn_distance + last_obstacle_position_y:
		_spawn_obstacle(last_obstacle_position_y - obstacle_distance)
		last_obstacle_position_y -= obstacle_distance
		
func _spawn_obstacle(position_y: float):
	if not obstacles_scenes:
		return
	var obstacle_scene = get_obstacle_scene()
	var obstacle = obstacle_scene.instantiate()
	obstacle.set_player(player)
	add_child(obstacle)
	obstacle.global_position = Vector2(viewport_size_x / 2, position_y)

func get_obstacle_scene():
	return obstacles_scenes.pick_random()

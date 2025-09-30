extends Path2D

var total_points = 20
var spacing_ratio: float = 10.0
var start_ratio: float = 0.0
var destroy_distance: float = 800
const POINT = preload("res://point_follow.tscn")

enum COLORS {
	GREEN,
	YELLOW,
	VIOLET,
	ORANGE
}

var star_scene: PackedScene = GLOBALS.STAR_SCENE
var star: Node

var player: CharacterBody2D

func _ready() -> void:
	star = star_scene.instantiate()
	star.position = global_position
	for i in total_points:
		var follower = POINT.instantiate()
		add_child(follower)
		follower.set_progress_ratio(i/float(total_points))
		var point_color = get_point_color(i)
		print(point_color)
		follower.setup_obstacle(point_color)
		
func get_point_color(index: int):
	var points_per_group = total_points / COLORS.size()
	if(index < points_per_group + COLORS.GREEN * points_per_group):
		return "green"
	if(index < points_per_group + COLORS.YELLOW * points_per_group):
		return "yellow"
	if(index < points_per_group + COLORS.VIOLET * points_per_group):
		return "violet"
	if(index < points_per_group + COLORS.ORANGE * points_per_group):
		return "orange"

func set_star_position():
	if not star:
		return
	get_tree().current_scene.add_child(star)
	star.position = global_position

func destroy():
	queue_free()

func _can_destroy_self() -> bool:
	if not player:
		return false
	var distance = global_position.y - player.global_position.y
	return distance > destroy_distance
	
func set_player(body: CharacterBody2D):
	player = body

	

extends Node2D

@export var rotation_speed: float = -60.0
@export var destroy_distance: float = 800
@export var star_scene: PackedScene

var player: CharacterBody2D

func _ready() -> void:
	set_global_scale(Vector2(0.4,0.4))
	if star_scene:
		var star = star_scene.instantiate()
		add_child(star)
	
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
	print(distance)
	return distance > destroy_distance

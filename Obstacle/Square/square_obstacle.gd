extends Obstacle

func _ready() -> void:
	set_random_rotation()
	if star_scene:
		var star = star_scene.instantiate()
		star.global_position = Vector2(global_position.x, global_position.y)
		add_child(star)

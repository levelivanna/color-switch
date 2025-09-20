extends Obstacle

func _ready() -> void:
	set_random_rotation()
	if star_scene:
		var star = star_scene.instantiate()
		add_child(star)

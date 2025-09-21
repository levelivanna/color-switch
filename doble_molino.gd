extends Obstacle
var molino_rotation_speed = 60 

func _ready() -> void:
	super._ready()
	var left = get_child(0)
	var right = get_child(1)
	left.rotation_speed = molino_rotation_speed * -1
	right.rotation_speed = molino_rotation_speed
	left.star = null
	right.circle_color = null
	left.reset_position_x()
	right.reset_position_x()
	rotation_speed = 0

func set_star_position():
	super.set_star_position()
	if not star:
		return
	star.position.y = global_position.y - 60

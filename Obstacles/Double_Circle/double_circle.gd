extends Obstacle

var circles_rotation_speed = 60.0

func _ready() -> void:
	super._ready()
	var left = get_child(0)
	var right = get_child(1)
	left.rotation_speed = circles_rotation_speed * -1
	right.rotation_speed = circles_rotation_speed
	left.star = null
	right.circle_color = null
	rotation_speed = 0
	can_invert_ratation = false
	

func set_star_position():
	super.set_star_position()
	if not star:
		return
	star.position.y = global_position.y - 60
	
	

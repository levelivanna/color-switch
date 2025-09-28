extends Obstacle
var displacement_distance = 60
var center_position_x = 0
var direction_x = [-1,1]
var initial_position_x = 0

func _ready() -> void:
	super._ready()
	set_random_rotation()
	center_position_x = displacement_distance * direction_x.pick_random()
	initial_position_x = global_position.x
	global_position.x = global_position.x + center_position_x
	
func _process(delta: float) -> void:
	super._process(delta)
	
func set_star_position():
	super.set_star_position()
	star.position = Vector2(global_position.x + (center_position_x * - 1), global_position.y)
	
func set_circle_color_position():
	super.set_circle_color_position()
	circle_color.position.x = global_position.x + (center_position_x * - 1)

func reset_position_x():
	global_position.x = initial_position_x

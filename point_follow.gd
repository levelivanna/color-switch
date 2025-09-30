extends PathFollow2D

var speed = 0.3
var my_color

var violet_script = preload("res://Obstacles/Scripts/violet.gd")
var green_script = preload("res://Obstacles/Scripts/green.gd")
var yellow_script = preload("res://Obstacles/Scripts/yellow.gd")
var orange_script = preload("res://Obstacles/Scripts/orange.gd")


func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress_ratio = progress_ratio + delta * speed
	
func setup_obstacle(color: String):
	var point_area = get_node('Point')
	point_area.scale.x = 0.5
	point_area.scale.y = 0.5
	var point_sprite = get_node('Point/Sprite2D')
	
	match color:
		"green":
			point_area.set_script(green_script)
			point_sprite.modulate = GLOBALS.COLOR.GREEN
		"yellow":
			point_area.set_script(yellow_script)
			point_sprite.modulate = GLOBALS.COLOR.YELLOW
		"orange":
			point_area.set_script(orange_script)
			point_sprite.modulate = GLOBALS.COLOR.ORANGE
		"violet":
			point_area.set_script(violet_script)
			point_sprite.modulate = GLOBALS.COLOR.VIOLET
		
	
	

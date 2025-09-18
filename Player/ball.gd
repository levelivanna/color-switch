extends CharacterBody2D
var pink = Color("#FF007F")
var cyan = Color("#00CFFF")
var yellow = Color("#FFD700")
var violet = Color("#8A2BE2")
@export var score = 0
@export var colors: Array[Color] = [pink, yellow, cyan, violet]
var current_color: Color = pink
var screen_center = 0.0

const SPEED = 0.0
const JUMP_VELOCITY = -300.0

func _ready():
	randomize()
	screen_center = get_viewport().size.x / 2
	global_position.x = screen_center
	set_ball_color(colors.pick_random())
	
func set_ball_color(new_color: Color):
	current_color = new_color
	$Sprite2D.modulate = current_color
	
func change_color():
	var newColors = colors.filter(func(color):
		return color != current_color
	)
	var newColor = newColors.pick_random()
	set_ball_color(newColor)

func _physics_process(delta: float) -> void:
	velocity += get_gravity() * delta 
	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY
	move_and_slide()

func get_current_color():
	return current_color
	
func destroy():
	#queue_free()
	pass
	
func add_score(points: int):
	score = score + points

func get_score():
	return score

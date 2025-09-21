extends CharacterBody2D

var current_color: Color = GLOBALS.COLOR.GREEN
var screen_center = 0.0
@export var score = 0
@export var colors: Array[Color] = [
	GLOBALS.COLOR.GREEN,
	GLOBALS.COLOR.YELLOW,
	GLOBALS.COLOR.ORANGE,
	GLOBALS.COLOR.VIOLET
]
@onready var jump_ball: AudioStreamPlayer2D = $JumpBall
@onready var star_pickup: AudioStreamPlayer2D = $StarPickup
@onready var circle_color: AudioStreamPlayer2D = $CircleColor

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
	circle_color.play()
	var newColor = newColors.pick_random()
	set_ball_color(newColor)

func _physics_process(delta: float) -> void:
	velocity += get_gravity() * delta 
	if Input.is_action_just_pressed("jump"):
		jump()
	move_and_slide()
	
func jump():
	velocity.y = JUMP_VELOCITY
	jump_ball.play()
	
func get_current_color():
	return current_color
	
func destroy():
	play_dead_sound()
	GLOBALS.create_particle('player_explosion', global_position)
	queue_free()
	
func play_dead_sound():
	GLOBALS.play_destroy_sound()
	
func add_score(points: int):
	star_pickup.play()
	score = score + points

func get_score():
	return score

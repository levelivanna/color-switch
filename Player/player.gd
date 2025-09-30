extends CharacterBody2D

var current_color: Color = GLOBALS.COLOR.GREEN
var screen_center = 0.0
var is_damaged = false
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var jump_ball: AudioStreamPlayer2D = $JumpBall
@onready var star_pickup: AudioStreamPlayer2D = $StarPickup
@onready var circle_color: AudioStreamPlayer2D = $CircleColor
@onready var destroy_sfx: AudioStreamPlayer2D = $DestroySFX
@onready var game: Node2D = $".."

@export var colors: Array[Color] = [
	GLOBALS.COLOR.GREEN,
	GLOBALS.COLOR.YELLOW,
	GLOBALS.COLOR.ORANGE,
	GLOBALS.COLOR.VIOLET
]
const SPEED = 0.0
const JUMP_VELOCITY = -300.0

var explosion_gpu_particle: GPUParticles2D

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
	if(is_damaged):
		return
	velocity += get_gravity() * delta 
	if Input.is_action_just_pressed("jump"):
		jump()
	move_and_slide()
	
func jump():
	velocity.y = JUMP_VELOCITY
	jump_ball.play()
	
func get_current_color():
	return current_color
	
func handle_damage():
	is_damaged = true
	collision_shape_2d.queue_free()
	sprite_2d.visible = false              
	play_destroy_sound()
	await particle_explosion()
	game.game_over()
	
	
func add_score(points: int):
	star_pickup.play()
	var current_score = GLOBALS.get_score() + points
	GLOBALS.set_score(current_score)

func get_score():
	return GLOBALS.get_score()
	
func on_finish_explosion():
	GLOBALS.game_over()

func particle_explosion():
	var selected_particle = GLOBALS.player_explosion  
	var new_particle_node: Node = selected_particle.instantiate()
	new_particle_node.position = position
	get_tree().current_scene.add_child(new_particle_node)
	await get_tree().create_timer(1).timeout
		

func play_destroy_sound():
	destroy_sfx.play()
	

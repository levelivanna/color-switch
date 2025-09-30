extends Node

var player_explosion = preload("res://Player/explosion.tscn")
var star_explosion = preload("res://Star/star_particles.tscn")
var destroy_sound = preload("res://Sounds/Effects/destroy.ogg")
var _score = 0
var _record_score = 0
var increase_speed_score = 10

const SCENE = {
	LEVEL_1 = "res://Scenes/Game/game.tscn",
	CREDITS = "res://Scenes/Credits/credits.tscn",
	GAME_OVER = "res://Scenes/GameOver/game_over.tscn",
	MENU = "res://Scenes/Menu/main_menu.tscn"
}

const CIRCLE_COLOR_SCENE = preload("res://Circle_Color/circle_color.tscn")
const STAR_SCENE = preload("res://Star/star.tscn")

const COLOR = {
	ORANGE = Color("#FEC9A7"),
	GREEN = Color("#A5F8CE"),
	YELLOW = Color("#FEFD97"),
	VIOLET = Color("#B49FDC")
}

func create_particle(particle_name: String, position: Vector2):
	var selected_particle: PackedScene
	match particle_name:
		'star_explosion':
			selected_particle = star_explosion
	var new_particle: Node = selected_particle.instantiate()
	new_particle.position = position
	get_tree().current_scene.add_child(new_particle)
	await get_tree().create_timer(1).timeout
	destroy_particle(new_particle)
	
func destroy_particle(particle):
	particle.queue_free()
	

func set_record(new_record: int):
	_record_score = new_record

func set_score(new_score: int):
	_score = new_score
	
func get_record():
	return _record_score

func get_score():
	return _score
	
func go_to_game_over_screen():
	get_tree().change_scene_to_file(SCENE.GAME_OVER)

func retry():
	set_score(0)
	get_tree().change_scene_to_file(SCENE.LEVEL_1)
	
func go_menu():
	get_tree().change_scene_to_file(SCENE.MENU)
	
	

extends Node

var player_explosion = preload("res://Player/explosion.tscn")
var destroy_sound = preload("res://Sounds/Effects/Destroy.ogg")

const SCENE = {
	LEVEL_1 = "res://Scenes/Game/Game.tscn"
}

const CIRCLE_COLOR_SCENE = preload("res://CircleColor/CircleColor.tscn")
const STAR_SCENE = preload("res://Star/Star.tscn")

const COLOR = {
	ORANGE = Color("#FEC9A7"),
	GREEN = Color("#A5F8CE"),
	YELLOW = Color("#FEFD97"),
	VIOLET = Color("#B49FDC")
}

func create_particle(particle_name: String, position: Vector2):
	var selected_particle: PackedScene
	match particle_name:
		'player_explosion':
			selected_particle = player_explosion
	var new_particle: Node = selected_particle.instantiate()
	new_particle.position = position
	get_tree().current_scene.add_child(new_particle)
	await get_tree().create_timer(1).timeout
	destroy_particle(new_particle)
	
func destroy_particle(particle):
	particle.queue_free()
	
func play_destroy_sound():
	var player = AudioStreamPlayer2D.new()
	player.stream = destroy_sound
	player.position = Vector2.ZERO
	player.volume_db = 0
	get_tree().current_scene.add_child(player) # se agrega a la escena actual
	player.play()
	player.finished.connect(func(): player.queue_free())

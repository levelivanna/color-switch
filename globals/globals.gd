extends Node

var player_explosion = preload("res://Player/explosion.tscn")

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

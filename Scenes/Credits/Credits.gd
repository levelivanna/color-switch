extends Control

@onready var music_credits: AudioStreamPlayer = $AudioStreamPlayer

func _ready():
	music_credits.play()

func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file(GLOBALS.SCENE.MENU)

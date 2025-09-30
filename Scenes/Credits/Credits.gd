extends Control

@onready var music_credits: AudioStreamPlayer = $AudioStreamPlayer

func _ready():
	music_credits.play()

func _on_quit_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file(GLOBALS.SCENE.MENU)

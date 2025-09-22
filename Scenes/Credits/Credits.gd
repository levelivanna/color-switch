extends Control

func _ready():
	pass

func _on_quit_pressed():
	get_tree().change_scene_to_file("res://Scenes/Main_menu.tscn")

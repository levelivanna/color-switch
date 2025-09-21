extends Control

func _ready():
	$VBoxContainer/Button.pressed.connect(_on_quit_pressed)

func _on_quit_pressed():
	get_tree().change_scene_to_file("res://Scenes/Main_menu.tscn")
 

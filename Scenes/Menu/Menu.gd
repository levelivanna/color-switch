extends Control


func _ready():
	for button in $VBoxContainer.get_children():
		if button is Button:
			button.pressed.connect(_on_button_pressed.bind(button.name))

func _on_button_pressed(button_name: String):
	print(button_name)
	match button_name:
		"Play":
			get_tree().change_scene_to_file(GLOBALS.SCENE.LEVEL_1)
		"Creditos":
			get_tree().change_scene_to_file("res://Scenes/Credits/Credits.tscn")
		"Ajustes":
			get_tree().change_scene_to_file("res://Scenes/Settings/Settings.tscn")

func _on_quit_pressed():
	get_tree().quit()

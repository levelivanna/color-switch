extends Control

func _ready():
	pass

func _on_quit_pressed():
	get_tree().quit()

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file(GLOBALS.SCENE.LEVEL_1)

func _on_credits_pressed() -> void:
		get_tree().change_scene_to_file(GLOBALS.SCENE.CREDITS)

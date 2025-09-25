extends Control
@onready var music_menu_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var transition_manager: CanvasLayer = $TransitionManager

const FADE_OUT_SECONDS = 1.0

func _ready():
	pass

func _on_quit_pressed():
	get_tree().quit()

func _on_play_pressed() -> void:
	change_scene_with_fade(GLOBALS.SCENE.LEVEL_1)

func _on_credits_pressed() -> void:
		get_tree().change_scene_to_file(GLOBALS.SCENE.CREDITS)
		
func change_scene_with_fade(new_scene_path: String) -> void:
	var tween = create_tween()
	transition_manager.fade_in()
	tween.tween_property(music_menu_player, "volume_db", -80, FADE_OUT_SECONDS)
	await tween.finished
	get_tree().change_scene_to_file(new_scene_path)

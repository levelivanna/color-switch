extends Node

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
	
	

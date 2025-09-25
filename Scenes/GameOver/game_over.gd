extends Control
@onready var score_value: Label = $CenterContainer/VBoxContainer/HBoxContainer/ScoreValue
@onready var record_value: Label = $CenterContainer/VBoxContainer/HBoxContainer2/RecordValue
@onready var transition_manager: CanvasLayer = $TransitionManager


func _ready() -> void:
	_process_score()
	set_text_values()
	transition_manager.fade_out()

func _process_score():
	var score = GLOBALS.get_score()
	var record = GLOBALS.get_record()
	if score > record:
		GLOBALS.set_record(score)

func set_text_values():
	score_value.text = str(GLOBALS.get_score())
	record_value.text = str(GLOBALS.get_record())
	

func _on_reintentar_pressed() -> void:
	GLOBALS.retry()


func _on_menu_principal_pressed() -> void:
	GLOBALS.go_menu()

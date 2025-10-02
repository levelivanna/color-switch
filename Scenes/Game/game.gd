extends Node2D
@onready var pause_controller: Node2D = $CanvasLayer/Pause

@onready var player: CharacterBody2D = $Ball
@onready var transition_manager: CanvasLayer = $TransitionManager 

func _ready() -> void:
	GLOBALS.set_score(0)
	transition_manager.fade_out()

func _on_pause_button_pressed() -> void:
	pause_controller.pause()
	
func game_over():
	GLOBALS.go_to_game_over_screen()
	

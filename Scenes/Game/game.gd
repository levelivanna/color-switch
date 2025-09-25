extends Node2D
@onready var pause_controller: Node2D = $Pause
@onready var player: CharacterBody2D = $Ball

func _ready() -> void:
	GLOBALS.set_score(0)

func _on_pause_button_pressed() -> void:
	pause_controller.pause()
	

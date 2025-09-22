extends Node2D

func _ready() -> void:
	visible = false

func pause():
	get_tree().paused = true
	visible = true
	
func resume():
	get_tree().paused = false
	visible = false

func _on_resume_button_pressed() -> void:
	resume()

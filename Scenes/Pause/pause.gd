extends Node2D

func _ready() -> void:
	visible = false

func pause():
	get_tree().paused = true
	visible = true
	
func resume():
	get_tree().paused = false
	visible = false

func _process(delta: float):
	if Input.is_action_just_pressed("pause"):
		toggle_pause()
	
func _on_resume_button_pressed() -> void:
	resume()

func toggle_pause():
	if get_tree().paused:
		resume()
	else:
		pause()

extends CanvasLayer
@onready var score_label: Label = $ScoreLabel
@onready var ball: CharacterBody2D = $"../Ball"


func _process(delta: float):
	if ball:
		var score = ball.get_score()
		score_label.text = str(score) 

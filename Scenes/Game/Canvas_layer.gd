extends CanvasLayer
@onready var score_label: Label = $ScoreLabel


func _process(delta: float):
	var score = GLOBALS.get_score()
	score_label.text = str(score) 

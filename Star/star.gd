extends Area2D
@export var points: int = 1

func _ready():
	body_entered.connect(_on_body_entered)
	global_scale = Vector2(0.8, 0.8)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.add_score(points)
		destroy()

func destroy():
	queue_free()
		

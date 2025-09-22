extends Area2D
@export var points: int = 1
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready():
	body_entered.connect(_on_body_entered)
	global_scale = Vector2(0.8, 0.8)
	animation_player.play('pulse')

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.add_score(points)
		GLOBALS.create_particle('star_explosion', global_position)
		destroy()

func destroy():
	queue_free()
		

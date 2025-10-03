extends Area2D

@onready var circle_color_audio: AudioStreamPlayer2D = $CircleColor
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var circle_collision: CollisionShape2D = $CircleCollision

func _ready():
	body_entered.connect(_on_body_entered)
	circle_color_audio.autoplay = false
	

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.change_color()
		circle_color_audio.play()
		sprite_2d.queue_free()
		circle_collision.queue_free()
		
func destroy():
	queue_free()

func _on_circle_color_finished() -> void:
	destroy()

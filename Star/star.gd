class_name Star
extends Area2D
@export var points: int = 1
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var star_particles: StarParticle = $StarParticles
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var star_pickup: AudioStreamPlayer2D = $StarPickup


func _ready():
	body_entered.connect(_on_body_entered)
	global_scale = Vector2(0.8, 0.8)
	animation_player.play('pulse')
	star_particles.finished.connect(destroy)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		star_pickup.play()
		body.add_score(points)
		sprite_2d.visible = false
		collision_shape_2d.queue_free()
		star_particles.animation_start()

func destroy():
	queue_free()
		

extends Area2D
@onready var player: Node2D = get_tree().get_first_node_in_group("player")

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body == player:
		player.change_color()
		destroy()

func destroy():
	queue_free()

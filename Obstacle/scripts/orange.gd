extends Area2D
@onready var player: Node2D = get_tree().get_first_node_in_group("player")
var my_color: Color = Color("FEC9A7")

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(body: Node2D) -> void:
	if body == player and player.get_current_color() == my_color:
		pass
	else:
		player.destroy()
	

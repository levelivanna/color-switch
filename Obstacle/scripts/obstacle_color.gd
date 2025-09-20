class_name ObstacleColor
extends Area2D
@onready var player: Node2D = get_tree().get_first_node_in_group("player")
var my_color: Color

func _ready() -> void:
	print('hola')
	
func _on_body_entered(body: Node2D) -> void:
	if body == player and player.get_current_color() == my_color:
		pass
	else:
		player.destroy()


func _set_color(color: Color):
	my_color = color

func _init(color):
	body_entered.connect(_on_body_entered)
	_set_color(color)
 

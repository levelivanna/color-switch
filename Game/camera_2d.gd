extends Camera2D

@export var player: Node2D
@export var smooth_speed: float = 5.0
	

func _process(delta: float) -> void:
	if not player:
		return
	
	if player.global_position.y < global_position.y:
		global_position.y = lerp(global_position.y, player.global_position.y, delta * smooth_speed)

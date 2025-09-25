extends CanvasLayer
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	visible = false

func fade_out() -> void:
	visible = true
	animation_player.play("fade_out")

func fade_in() -> void:
	visible = true
	animation_player.play("fade_in")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	print('tefminoffff jaja')
	visible = false

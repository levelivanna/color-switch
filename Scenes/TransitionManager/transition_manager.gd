extends CanvasLayer
@onready var animation_player: AnimationPlayer = $AnimationPlayer

signal fade_out_finished
signal fade_in_finished

func _ready() -> void:
	visible = false

func fade_out() -> void:
	visible = true
	animation_player.play("fade_out")

func fade_in() -> void:
	visible = true
	animation_player.play("fade_in")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	visible = false
	if anim_name == "fade_out":
		emit_signal("fade_out_finished")
	elif anim_name == "fade_in":
		emit_signal("fade_in_finished")

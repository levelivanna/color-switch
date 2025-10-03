class_name StarParticle
extends Node2D
@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D

signal finished

func _ready() -> void:
	gpu_particles_2d.one_shot = true

func _process(delta: float) -> void:
	pass

func _on_gpu_particles_2d_finished() -> void:
	finished.emit()

func animation_start():
	gpu_particles_2d.restart()

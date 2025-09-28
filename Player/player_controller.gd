extends Node
@onready var player: CharacterBody2D = self.owner
  
enum PLAYER_STATE {
	FALLING,
	JUMPING,
	DAMAGED,
	COLOR_CHANGING
}

var current_state: PLAYER_STATE

var default_state = PLAYER_STATE.FALLING

func _ready() -> void:
	current_state = default_state

func _physics_process(delta: float) -> void:
	match current_state:
		PLAYER_STATE.FALLING:
			pass
		PLAYER_STATE.JUMPING:
			pass
		PLAYER_STATE.DAMAGED:
			pass
		PLAYER_STATE.COLOR_CHANGING:
			pass

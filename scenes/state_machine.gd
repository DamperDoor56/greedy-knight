extends Node2D
class_name StateMachine

var state = null
var previus_state = null

@onready var parent = get_parent()

func _state_logic(delta):
	pass
	
func _get_transition(delta):
	return null

func _enter_state(new_state, old_state):
	pass

func set_state(new_state):
	previus_state = state
	state = new_state
	
	

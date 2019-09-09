extends Node
class_name StateMachine

var state : State
var previous : State
var states = {}

onready var host = get_parent()

signal state_machine_transition(new_state)

func _physics_process(delta):
	if state:
		_process_state(delta)

func _process_state(delta):
	var new_state = state.update(delta, host)
	if new_state:
		_transition_to(new_state)
	
func _add_state(state, path):
	states[state]  =  path
	
func _transition_to(new_state):
	emit_signal("state_machine_transition", new_state)	
	
	if state:
		state.exit(host)
	previous = state
	state = new_state
	state.enter(host)
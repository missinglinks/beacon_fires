extends StateMachine

func _ready():
	_add_state("Idle", $Idle)
	_add_state("Running", $Running)
	_add_state("Stumbling", $Stumbling)
	
	call_deferred("_transition_to", states.Idle)
	
	
func trigger_state(state):
	_transition_to(state)
extends StateMachine

func _ready():
	_add_state("Init", $Init)
	_add_state("Action", $Action)
	_add_state("Retry",  $Retry)
	_add_state("Fail", $Fail)
	_add_state("Success", $Success)
	
	
	call_deferred("_transition_to", states.Init)
	
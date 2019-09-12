extends StateMachine

func _ready():
	_add_state("Wandering", $Wandering)
	_add_state("Attack", $Attack)
	
	
	call_deferred("_transition_to", states.Wandering)
	
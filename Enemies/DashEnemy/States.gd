extends StateMachine

func _ready() -> void:
	_add_state("Wandering", $Wandering)
	_add_state("Windup", $Windup)
	_add_state("Attack", $Attack)
	
	call_deferred("_transition_to", states.Wandering)
	
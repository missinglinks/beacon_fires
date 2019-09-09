extends State

func enter(host):
	host.anim.play("idle")
	$Timer.wait_time = 0.5
	$Timer.start()
	
func update(delta, host):
	pass
	
func exit(host):
	pass

func _on_Timer_timeout():
	state_machine._transition_to(state_machine.states.Idle)

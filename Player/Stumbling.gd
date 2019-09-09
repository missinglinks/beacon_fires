extends State

func enter(host):
	#yield (get_tree().create_timer(0.4), "timeout")
	
	host.anim.play("idle")
	$Timer.wait_time = 0.5
	$Timer.start()
	
func update(delta, host):
	#host.move_player(Vector2.ZERO, delta)
	pass
	
func exit(host):
	pass

func _on_Timer_timeout():
	state_machine._transition_to(state_machine.states.Idle)

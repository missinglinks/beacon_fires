extends State


func enter(host):
	host.set_movement(Vector2(rand_range(-250, 250), rand_range(0, -2000)), 20)
	#host.current_move_target = Vector2(rand_range(-250, 250), rand_range(0, -2000))
	
func update(delta, host):
	
	#var motion_dir = host.current_move_target - host.position
	#motion_dir = motion_dir.normalized()
	if host.target:
		if host.position.distance_to(host.target.position) < host.notice_radius:
			return state_machine.states.Attack

func exit(host):
	host.current_move_target = Vector2.ZERO
	


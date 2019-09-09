extends State

var current_dir = "up"

func set_animation(host):
	match host.direction:
		"up":
			host.anim.play("run_up")
		"down":
			host.anim.play("run_up")
		"left":
			host.anim.play("run_left")
		"right":
			host.anim.play("run_right")

func enter(host):
	match host.direction:
		"up":
			host.anim.play("run_up")
		"down":
			host.anim.play("run_up")
		"left":
			host.anim.play("run_left")
		"right":
			host.anim.play("run_right")

	
func update(delta, host):
	var input = host.get_input_axis()
	
	host.move_player(input, delta)
	
	if host.direction != current_dir:
		current_dir = host.direction
		set_animation(host)
		
	
	if host.motion == Vector2.ZERO:
		return state_machine.states.Idle
	
	
func exit(host):
	pass


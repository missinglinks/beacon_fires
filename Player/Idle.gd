extends State


func enter(host):
	host.motion = Vector2.ZERO
	match host.direction:
		"up":
			host.anim.play("idle")
		"down":
			host.anim.play("idle")
		"left":
			host.anim.play("idle_left")
		"right":
			host.anim.play("idle_right")
	
func update(delta, host):
	var input = Vector2.ZERO
	if GameState.input_on:
		input = host.get_input_axis()
	
	if input != Vector2.ZERO:
		return state_machine.states.Running
	
func exit(host):
	pass
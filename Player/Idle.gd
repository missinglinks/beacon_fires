extends State


func enter(host):
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
	var input = host.get_input_axis()
	
	if input != Vector2.ZERO:
		return state_machine.states.Running
	
func exit(host):
	pass
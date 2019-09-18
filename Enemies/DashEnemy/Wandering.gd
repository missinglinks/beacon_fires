extends State

onready var vis: VisibilityNotifier2D= get_node("../../VisibilityNotifier")

func enter(host):
	host.set_movement(Vector2(rand_range(-250, 250), rand_range(0, -GameState.level_height)), 20)
	
func update(delta, host):
	host.move_body(delta)
	if is_instance_valid(host):
		if is_instance_valid(host.target):
			var pos_to_target = host.position.distance_to(host.target.position)
			if pos_to_target < host.notice_radius and vis.is_on_screen() and GameState.state == GameState.states.Action:
				return state_machine.states.Windup

func exit(host):
	host.current_move_target = Vector2.ZERO
	


extends State

func enter(host):
	GameState.beacons_lit += 1
	GameState.input_on = false
	Engine.set_time_scale(0.5)
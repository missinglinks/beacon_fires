extends State

var trail = preload("res://Enemies/DashEnemy/DashEnemyTrail.tscn")

func enter(host):
	$TrailTimer.start()

func update(delta, host):
	host.dash(delta)
	if host.dash_target.distance_to(host.position) <= 20:
		return state_machine.states.Wandering


func exit(host):
	$TrailTimer.stop()


func _on_TrailTimer_timeout():
	var tr = trail.instance()
	tr.position = state_machine.host.position
	state_machine.host.get_parent().add_child(tr)

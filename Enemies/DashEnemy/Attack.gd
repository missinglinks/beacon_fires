extends State

var trail = preload("res://Enemies/DashEnemy/DashEnemyTrail.tscn")

func enter(host) -> void:
	$TrailTimer.start()

func update(delta: float, host) -> State:
	host.dash(delta)
	if host.dash_target.distance_to(host.position) <= 20:
		return state_machine.states.Wandering
	
	return null


func exit(host) -> void:
	$TrailTimer.stop()


func _on_TrailTimer_timeout() -> void:
	var tr = trail.instance()
	tr.position = state_machine.host.position
	state_machine.host.get_parent().add_child(tr)

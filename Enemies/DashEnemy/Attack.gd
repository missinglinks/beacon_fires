extends State

var target_position
var dash_speed = 600

onready var windup_particles = get_node("../../WindupParticles") 

func enter(host):
	$WindupTimer.wait_time = host.attack_windup
	$WindupFollowTimer.wait_time = host.attack_windup / 2	
	start_attack(host)

func update(delta, host):
	if host.target.position.distance_to(host.position) > host.notice_radius:
		return state_machine.states.Wandering
		
func exit(host):
	windup_particles.emitting = false
	$WindupFollowTimer.stop()
	$WindupTimer.stop()

func start_attack(host):
	#target_position = host.target.global_position
	print("start particles")
	$WindupTimer.start()	
	$WindupFollowTimer.start()

func _on_WindupTimer_timeout():
	print("Stop particles")
	windup_particles.emitting = false
	state_machine.host.set_movement(target_position, dash_speed) 
	#state_machine.host.move_and_collide(target_position - state_machine.host.position)
	start_attack(state_machine.host)
	target_position = null
	
func _on_WindupFollowTimer_timeout():
	target_position = state_machine.host.target.global_position
	windup_particles.emitting = true

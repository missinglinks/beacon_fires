extends State

var target_position
var dash_speed
var indication_time

var target_dir

onready var indicator_sprite: Sprite = get_node("../../IndicationSprite")
onready var indicator_tween: Tween = indicator_sprite.get_node("Tween")

func enter(host):
	indicator_sprite.scale = Vector2(0.5, 0.5)
	dash_speed = host.dash_speed
	$WindupTimer.wait_time = host.attack_windup
	$WindupFollowTimer.wait_time = host.attack_windup * 0.8
	indication_time = host.attack_windup * 0.2
	
	start_attack(host)

func update(delta, host):
	if host.target.position.distance_to(host.position) > host.notice_radius:
		return state_machine.states.Wandering
		
func exit(host):
	$WindupFollowTimer.stop()
	$WindupTimer.stop()
	indicator_sprite.visible = false

func start_attack(host):
	$WindupTimer.start()	
	$WindupFollowTimer.start()

func _turn_on_indicator():
	target_dir = (target_position-state_machine.host.global_position).normalized()
	indicator_sprite.position = target_dir * 25
	indicator_sprite.rotation = target_dir.angle() + PI / 2
	
	indicator_tween.interpolate_property(indicator_sprite, "scale", Vector2(0.5, 0.5), Vector2(3, 3), indication_time, Tween.TRANS_LINEAR, Tween.EASE_IN)
	indicator_tween.interpolate_property(indicator_sprite, "modulate",  Color(1, 1, 1, 0), Color(1, 1, 1, 1), indication_time/2, Tween.TRANS_LINEAR, Tween.EASE_IN)
	indicator_tween.start()
	indicator_sprite.visible = true
	
	
func _turn_off_indicator():
	indicator_tween.stop_all()
	indicator_sprite.visible = false
	indicator_sprite.scale = Vector2(0.5, 0.5)


func _on_WindupTimer_timeout():
	_turn_off_indicator()
	state_machine.host.set_movement(target_position+target_dir*100, dash_speed) # attack dash
	
	start_attack(state_machine.host) #restart attack
	target_position = null
	
	
func _on_WindupFollowTimer_timeout():
	target_position = state_machine.host.target.global_position
	_turn_on_indicator()



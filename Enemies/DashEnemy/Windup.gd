extends State

onready var indicator_sprite: Sprite = get_node("../../IndicationSprite")
onready var indicator_tween: Tween = indicator_sprite.get_node("Tween")
onready var windup_timer: Timer = $WindupTimer
onready var follow_timer: Timer = $WindupFollowTimer

var target_position: Vector2
var indication_time: float

var target_dir: Vector2
var elapsed_time: float = 0


func enter(host) -> void:
	indicator_sprite.scale = Vector2(0.5, 0.5)
	windup_timer.wait_time = host.attack_windup
	follow_timer.wait_time = host.attack_windup * 0.8
	indication_time = host.attack_windup * 0.2
	
	start_windup(host)


func update(delta, host) -> State:
	elapsed_time += delta
	host.position += Vector2(sin(elapsed_time*100)*5 * (host.attack_windup - windup_timer.time_left), 0)
	
	if host.target.position.distance_to(host.position) > host.notice_radius:
		return state_machine.states.Wandering

	return null


func exit(host) -> void:
	follow_timer.stop()
	windup_timer.stop()
	indicator_sprite.visible = false


func start_windup(host) -> void:
	windup_timer.start()
	follow_timer.start()


func _turn_on_indicator() -> void:
	indicator_sprite.position = target_dir * 25
	indicator_sprite.rotation = target_dir.angle() + PI / 2
	indicator_tween.interpolate_property(indicator_sprite, "scale", Vector2(0.5, 0.5), Vector2(3, 3), indication_time, Tween.TRANS_LINEAR, Tween.EASE_IN)
	indicator_tween.interpolate_property(indicator_sprite, "modulate",  Color(1, 1, 1, 0), Color(1, 1, 1, 1), indication_time/2, Tween.TRANS_LINEAR, Tween.EASE_IN)
	indicator_tween.start()
	indicator_sprite.visible = true
	
	
func _turn_off_indicator() -> void:
	indicator_tween.stop_all()
	indicator_sprite.visible = false
	indicator_sprite.scale = Vector2(0.5, 0.5)


func _on_WindupTimer_timeout() -> void:
	_turn_off_indicator()
	state_machine._transition_to(state_machine.states.Attack)
	
	
func _on_WindupFollowTimer_timeout() -> void:
	target_position = state_machine.host.target.global_position
	target_dir = (target_position-state_machine.host.global_position).normalized()
	state_machine.host.dash_target = target_position+target_dir*100
	_turn_on_indicator()



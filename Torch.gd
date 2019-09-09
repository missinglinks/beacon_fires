extends Interactible

onready var timer = $Timer

export var active_time: float = 2.0

var is_active: bool = false

signal torch_picked_up(active_time)
signal time_changed(time_left)
signal torch_run_out()

func _ready():
	interaction_prompt = "pick up"


func _process(delta):
	emit_signal("time_changed", timer.time_left)


func action():
	print("torch action")
	is_active = true
	timer.wait_time = active_time
	timer.start()
	emit_signal("torch_picked_up", active_time)
	#disable collision shape and hide object
	$Area2D/CollisionShape2D.disabled=true
	visible = false


func _on_Timer_timeout():
	is_active = false
	emit_signal("torch_run_out")
	print("torch time out")

func _on_BeaconFire_beacon_lit():
	timer.paused =true

extends Interactible

onready var timer = $Timer

export var active_time: float = 2.0

var is_active: bool = false

signal torch_picked_up(active_time)
signal time_changed(time_left)
signal torch_run_out()

func _ready() -> void:
	prompt_offset = Vector2(-50, -40)
	interaction_prompt = "pick up"


func _process(delta: float) -> void:
	emit_signal("time_changed", timer.time_left)


func action() -> void:
	is_active = true
	timer.wait_time = PlayerStats.base_torch_time
	timer.start()
	emit_signal("torch_picked_up", PlayerStats.base_torch_time)
	
	#disable collision shape and hide object
	$CollisionShape2D.disabled=true
	visible = false


func _on_Timer_timeout() -> void:
	is_active = false
	GameState.level_failed()

func _on_BeaconFire_beacon_lit() -> void:
	timer.paused =true

extends Node

"""
Handles general game progression
"""

onready var player = get_node("../Player")

var level: int = 1

signal level_succeeded()
signal level_failed()


func _on_BeaconFire_beacon_lit():
	Engine.set_time_scale(0.2)
	yield(get_tree().create_timer(0.2), "timeout")
	Engine.set_time_scale(0)
	player.input_on = false
	emit_signal("level_succeeded")


func _on_Torch_torch_run_out():
	Engine.set_time_scale(0.2)
	yield(get_tree().create_timer(0.2), "timeout")
	Engine.set_time_scale(0)
	player.input_on = false
	emit_signal("level_failed")

extends Node

"""
Handles general game state and progression
"""

onready var retry_timer: Timer = $RetryTimer
onready var state_machine: StateMachine = $States
onready var states = $States.states

# game stats and variables
var points: int = 0
var beacons_lit: int = 0
var retries: int = 3

var state setget ,current_state

# general game management variables
var input_on = true

# level setup managment
var level_blocks: int = 2
var level_height
var level_width

signal level_succeeded()
signal level_failed()

func _ready():
	level_height = level_blocks * 500
	level_width = 500


func current_state():
	return state_machine.state


func reset_level_state():
	input_on = true
	Engine.set_time_scale(1)
	state_machine._transition_to(states.Init)	


func next_beacon():
	reset_level_state()
	get_tree().change_scene("res://World.tscn")


func reset_level():
	reset_level_state()
	get_tree().change_scene("res://World.tscn")


func restart_game():
	beacons_lit = 0
	retries = 3
	reset_level_state()
	get_tree().change_scene("res://World.tscn")	

func level_failed():
	if state_machine.state != states.Retry and state_machine.state != states.Success:
		emit_signal("level_failed")
		input_on = false
		Engine.set_time_scale(0.2)
		state_machine._transition_to($States.states.Retry)


func game_over():
	get_tree().change_scene("res://GameOverScreen/GameOverScreen.tscn")








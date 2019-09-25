extends Node

"""
Handles general game state and progression
"""

const UPGRADE_STEP: int = 2

onready var retry_timer: Timer = $RetryTimer
onready var state_machine: StateMachine = $States
onready var states = $States.states

# game stats and variables
var points: int = 0
var beacons_lit: int = 0
var next_upgrade: int = UPGRADE_STEP
var cats_petted: int = 0
var retries: int = 3

var shrines_activated: int = 0
var shrine_active: bool = false 

#important global variables
var state: State setget ,current_state
var player = null setget ,get_player

# general game management variables
var input_on: bool = true

# level setup managment
var level_blocks: int = 2
var level_height: float
var level_width: float

signal level_succeeded()
signal level_failed()


func _ready() -> void:
	level_height = level_blocks * 500
	level_width = 500


func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_end"):
		get_tree().quit()


"""
Returns the player node if its available in the current node.
Returns null, if no player is available
"""
func get_player() -> KinematicBody2D:
	if !player or !is_instance_valid(player):
		var players = get_tree().get_nodes_in_group("Player")
		if players:
			player = players[0]
		else:
			player = null
	return player


"""
Returns the current state of the state mashine
"""
func current_state() -> State:
	return state_machine.state


"""
Sets all level variables to their initial value
"""
func reset_level_state() -> void:
	player = null
	input_on = true
	shrine_active = false
	Engine.set_time_scale(1)
	state_machine._transition_to(states.Init)	


"""
After beacon is lit, move on to next level (beacon)
"""
func next_beacon() -> void:
	reset_level_state()
	get_tree().change_scene("res://World.tscn")


"""
In fail state, after player chooses retry
"""
func reset_level() -> void:
	reset_level_state()
	get_tree().change_scene("res://World.tscn")


"""
Sets all game progression variables to their initial
value
"""
func restart_game() -> void:
	Upgrades.reset()
	PlayerStats.reset()
	shrines_activated = 0
	shrine_active = false
	beacons_lit = 0
	retries = 3
	cats_petted = 0
	reset_level_state()
	get_tree().change_scene("res://World.tscn")	


"""
shrines only count as activated, if level is completeted (beacon lit). 
If the level is reset, the shrine has to be activated again.
"""
func activate_shrine() -> void:
	shrine_active = true


"""
Triggers retry state, only when state is not already retry or success
"""
func level_failed() -> void:
	if state_machine.state != states.Retry and state_machine.state != states.Success:
		emit_signal("level_failed")
		input_on = false
		Engine.set_time_scale(0.2)
		state_machine._transition_to($States.states.Retry)


"""
Transitions to success-state, count shrine when activated
"""
func level_succeeded() -> void:
	if shrine_active:
		shrines_activated += 1
	state_machine._transition_to(GameState.states.Success)


"""
Transition to game over scene
"""
func game_over() -> void:
	get_tree().change_scene("res://GameOverScreen/GameOverScreen.tscn")


"""
After upgrade process is complete, shrine count for next update is 
incremented accordingly
"""
func upgrade_completed() -> void:
	next_upgrade += UPGRADE_STEP





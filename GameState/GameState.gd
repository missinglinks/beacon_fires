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
var shrines_activated: int = 0
var shrine_active: bool = false
var next_upgrade: int = UPGRADE_STEP
var cats_petted: int = 0
var retries: int = 3

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


func get_player() -> KinematicBody2D:
	if !player:
		var players = get_tree().get_nodes_in_group("Player")
		if players:
			player = players[0]
	return player

func current_state() -> State:
	return state_machine.state


func reset_level_state() -> void:
	player = null
	input_on = true
	shrine_active = false
	Engine.set_time_scale(1)
	state_machine._transition_to(states.Init)	


func next_beacon() -> void:
	reset_level_state()
	get_tree().change_scene("res://World.tscn")


func reset_level() -> void:
	reset_level_state()
	get_tree().change_scene("res://World.tscn")


func restart_game() -> void:
	shrines_activated = 0
	shrine_active = false
	beacons_lit = 0
	retries = 3
	cats_petted = 0
	reset_level_state()
	get_tree().change_scene("res://World.tscn")	


func activate_shrine() -> void:
	shrine_active = true


func level_failed() -> void:
	if state_machine.state != states.Retry and state_machine.state != states.Success:
		emit_signal("level_failed")
		input_on = false
		Engine.set_time_scale(0.2)
		state_machine._transition_to($States.states.Retry)

func level_succeeded() -> void:
	if shrine_active:
		shrines_activated += 1
	state_machine._transition_to(GameState.states.Success)

func game_over() -> void:
	get_tree().change_scene("res://GameOverScreen/GameOverScreen.tscn")


func upgrade_completed() -> void:
	next_upgrade += UPGRADE_STEP





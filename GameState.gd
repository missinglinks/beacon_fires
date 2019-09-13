extends Node

"""
Handles general game progression
"""

onready var retry_timer: Timer = $RetryTimer

var points: int = 0

var beacons_lit: int = 0
var retries: int = 3

var _retry_state: bool = false
var level_succeeded: bool = false
var input_on = true

export var level_blocks: int = 3
var level_height
var level_width

signal level_succeeded()
signal level_failed()

func _ready():
	level_height = level_blocks * 500
	level_width = 500

func _process(delta):
	if Input.is_action_pressed("interact") and _retry_state and retries > 0:
		reset_level()


func reset_state():
	input_on = true
	level_succeeded = false
	_retry_state = false
	Engine.set_time_scale(1)


func next_beacon():
	reset_state()
	get_tree().change_scene("res://World.tscn")


func reset_level():
	reset_state()
	retries -= 1
	get_tree().change_scene("res://World.tscn")


func restart_game():
	reset_state()
	beacons_lit = 0
	retries = 3
	get_tree().change_scene("res://World.tscn")	


func game_over():
	get_tree().change_scene("res://GameOverScreen/GameOverScreen.tscn")


func level_succeeded():
	Engine.set_time_scale(0.2)
	yield(get_tree().create_timer(0.1), "timeout")
	Engine.set_time_scale(0)
	input_on = false
	beacons_lit += 1
	level_succeeded = true


func level_failed():
	if !_retry_state:
		_retry_state = true
		input_on = false
		Engine.set_time_scale(0.2)	
		retry_timer.start()


func _on_RetryTimer_timeout():
	if _retry_state:
		game_over()
